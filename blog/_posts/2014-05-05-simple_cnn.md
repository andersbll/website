---
layout: blog_post
title: A simple implementation of convolutional neural networks
date: 2014-05-22
---

I was recently asked for a simple implementation of a convolutional neural network (CNN).
The purpose was to allow GPU-savvy programmers to understand the problem by inspecting the code; and to serve as reference for their optimized implementation.
This request reignited a frustration from when I myself started looking into CNNs a couple of months ago: There are no easily read implementations available!
Most CNN implementations are either highly optimized GPU code or contain only barebone operations in a non-modular code structure.
In either case, the code is hard to read and the back-propagation algorithm is difficult to recognize.

As I failed to find anything usable online and, more likely, because I'm a computer scientist at heart, I ended up coding my own toy CNN from scratch! 
The top priority was simplicity - so Python/NumPy was a given.
For the performance critical operations (convolution and max-pooling), I had to use Cython to get tolerable speed.
The implementation is [available on my Github][nnet].
I have even included some [usage examples][nnet-examples] that should work right out of the box - just a `git clone` away!

**Note:** My CNN implementation is not in any way competitive with more mature libraries in terms of features and speed.
The code is only meant as a readable example of feed-forward neural networks.

## Implementation tips
Here is a list of lessons, of which some were learned in a pretty time-consumingly way.

 1. Check your back-propagated gradients for correctness using finite-difference calculation! You might as well think this into your program design from the start as this is the only sane way to verify the correctness of your implementation. And yes, bugs are inevitable.
 2. Make the network modular at the layer-level. This is not new if you have studied other popular implementations like [cuda-convnet][cuda-convnet] or [EBLearn][eblearn].
 Each layer should then implement a method for forward propagating the input and a method for back propagating the gradients. 
 3. Standard library [convolution operations][conv] are not suitable for CNNs. Typically, you work on a batch of images per gradient update.
Each image in this batch contains multiple channels and you convolve each image with a 3D filter to get one output channel.
If you perform 3D convolution, you would be restricted to a 'valid' convolution because you should not move you along the channel axis.
If you perform 2D convolution you can perform 'valid', 'same' or 'full' convolutions as you wish, however, you must perform many separate convolutions which is not good in terms of efficiency.
Moreover, I have yet to figure out how one would calculate the gradients of the weights from standard convolution operations.
 4. If you reach the edge of what NumPy is good for and it starts getting complicated; use Cython!
I spent a lot of time implementing max-pooling with [striding tricks][stride-tricks] to allow for sliding windows.
It was a mess in terms of readability.
In comparison, [a couple of nested for loops][pooling] in Cython are both easier to read and faster.


[nnet]: https://github.com/andersbll/nnet
[nnet-examples]: https://github.com/andersbll/nnet/blob/master/examples
[pooling]: https://github.com/andersbll/nnet/blob/master/nnet/convnet/pool.pyx
[stride-tricks]: http://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.strides.html
[eblearn]: http://eblearn.sourceforge.net/
[conv]: http://docs.scipy.org/doc/scipy-0.13.0/reference/generated/scipy.signal.convolve2d.html
[cuda-convnet]: http://code.google.com/p/cuda-convnet/
