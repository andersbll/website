---
layout: project
title: Shape index histograms for feature description
collaborators: Jacob S. Vestergaard, Anders B. Dahl, Rasmus Larsen
image: /images/shape_index.png
excerpt: We have developed a new feature descriptor relying on statistics of second order curvature. We have applied this method in two competitions within medical image analysis and have achieved good results.
---

This project started as a spin-off from my M.Sc. thesis in which we experimented with shape index histograms (SIHs) for local feature description.
As it turned out, this did not offer any improvements over traditional gradient orientation histograms (from e.g. SIFT).
Later, we have found that shape index histograms are good at characterizing texture-like features in images.

I believe that SIHs have the following three selling points compared to alternative texture descriptors:

- SIHs are low-dimensional (compared to e.g. [basic image features][bif] where a joint multi-scale histogram is constructed).
- SIH description is rotation invariant by construction because the shape index is derived from the eigenvalues of the local image Hessian.
- Intuitive scale parameters from the *scale-space* framework.


## Competition: Assessment of Mitosis Detection Algorithms
We participated in a MICCAI 2013 Grand Challenge on [mitosis detection][amida].
Our method using SIHs came in 2nd after a system using convolutional neural networks.
I think this is an excellent result considering the comfortable margin to the other non-deep learning methods.

## Competition: Cells Classification by Fluorescent Image Analysis
We entered a method using SIHs in a [competition on cell staining pattern classifaction][cccfia] in connection with the 20th IEEE International Conference on Image Processing (ICIP 2013).
Our method received the title *merit winner* as we came in 2nd just 0.1% below the 1st place.
Also, our SIHs had superior performance on most classes in the competition.

## Publication
{% reference larsen2014hep %}
[PDF]({{ site.pubs_path }}/larsen2014hep.pdf)
{% cite_details larsen2014hep %}

## Software
I have a [Python implementation][sih_code] of the shape index histograms online in my [image processing/computer vision toolkit][ipcv].


[cccfia]: http://nerone.diiie.unisa.it/contest-icip-2013/
[amida]: http://amida13.isi.uu.nl/
[bif]: http://dx.doi.org/10.1007/s11263-009-0315-0
[lbp]: http://www.scholarpedia.org/article/Local_Binary_Patterns
[sih_code]: http://github.com/andersbll/ipcv/blob/master/ipcv/feature_histograms.py
[ipcv]: http://github.com/andersbll/ipcv

