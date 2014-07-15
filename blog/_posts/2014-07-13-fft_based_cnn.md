---
layout: blog_post
title: FFT-based convolutional neural networks
date: 2014-07-14
---

A few weeks ago, I decided to implement my own convolution operations for the GPU.
My motivation was the need for an implementation that could be easily modified.
Unfortunately, most implementations available online are either slow or a big mess code-wise:

 * [cuda_convnet][cuda_convnet]: Very fast thanks to the highly tuned CUDA code. The convolutions functions alone ([1][cuda_conv1], [2][cuda_conv2], [3][cuda_conv3]) are several 1,000 lines of code. Impossible to edit for anyone besides the original author.
 * [Theano][theano]: Slower than cuda_convnet, still a bit messy using shared memory and other CUDA tricks.
 * [Caffe][caffe]: In my experience a factor of 3 slower than cuda_convnet (the authors state otherwise). Their implementation is nice and simple consisting of [im2col][im2col] operations and cuBLAS matrix multiplications.

I played around with all three above and even tried to do my own vanilla CUDA implementation (Big mistake! The performance was ~8 times slower than cuda_convnet).

I then discovered the paper [Fast Training of Convolutional Networks through FFTs][mathieu], which was quite an interesting read (if only I had found it earlier!).
FFT-based convolutions had crossed my mind before, but I suspected the filter sizes were too small for the convolutions to be worthwhile in Fourier domain. 
As it turns out, FFT-based convolutions are quite competitive; mainly for the following reasons:

* The Fourier transformations of filters can be reused as the filters are convolved with multiple images in a mini-batch.
* The Fourier transformations of the output gradients can be reused when back propagating gradients to both filters and input images.
* Summation over input channels can be performed in the Fourier domain, such that inverse Fourier transformations are only required once per output channel per image.
* Efficient, batched FFT implementation are available using [cuFFT][cufft].
* The point-wise convolutions can be implemented as batched matrix multiplications using [cuBLAS][cublas].

I also discovered that Sander Dieleman had experimented with [FFT convolutions for Theano][theano_convfft].
Unfortunately, his implementation does not currently include back propagation of gradients.
Moreover, it is written in high-level Theano, which I suspect is not flexible enough for an efficient implementation.

## My implementation

After the above failed attempts at doing my own convolutions, the FFT approach was a refreshing angle.
It took some time to figure out the functioning of the [batched][cufft_planmany] cuFFT operations with [advanced data layout][cufft_advanced_layout] (which, btw., I'd prefer any day over fiddling with indexing errors in ordinary convolutions!).

I now have a working implementation with the following highlights:

* Supports back-propagation of gradients for both input images and filters.
* Supports 0-padding of image borders.
* No limitations on filter sizes / number of channels. Though, one should aim for image dimensions that are powers of 2, 3, 5, or 7 for faster cuFFT operations.
* Contains (almost) no GPU architecture specific fine-tuning. This is taken care of by cuBLAS/cuFFT.
* Relatively simple implementation (under [350 lines][code] at the time of writing).

The implementation is still WIP but looks promising in terms of speed.
It even comes with a crude Theano wrapper.
Benchmarks will follow as soon as the Theano integration is done.
I have yet to figure out how to properly handle buffers and reusing FFTs in back propagation functions.

[Check it out today!][theano_ops]



[cuda_convnet]: http://code.google.com/p/cuda-convnet/
[cuda_conv1]: http://code.google.com/p/cuda-convnet/source/browse/trunk/src/cudaconv2/weight_acts.cu
[cuda_conv2]: http://code.google.com/p/cuda-convnet/source/browse/trunk/src/cudaconv2/filter_acts.cu
[cuda_conv3]: http://code.google.com/p/cuda-convnet/source/browse/trunk/src/cudaconv2/img_acts.cu
[theano]: http://www.deeplearning.net/software/theano/
[caffe]: http://caffe.berkeleyvision.org/
[im2col]: http://www.mathworks.se/help/images/ref/im2col.html
[mathieu]: http://arxiv.org/abs/1312.5851
[cufft]: http://docs.nvidia.com/cuda/pdf/CUFFT_Library.pdf
[cublas]: http://docs.nvidia.com/cuda/pdf/CUBLAS_Library.pdf
[theano_convfft]: http://benanne.github.io/2014/05/12/fft-convolutions-in-theano.html
[cufft_planmany]: http://docs.nvidia.com/cuda/cufft/#function-cufftplanmany
[cufft_advanced_layout]: http://docs.nvidia.com/cuda/cufft/#advanced-data-layout
[code]: http://github.com/andersbll/theano_ops/blob/master/theano_ops/abll/src/abll/conv_bc01_fft.cu
[theano_ops]: http://github.com/andersbll/theano_ops
