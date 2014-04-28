---
layout: project
title: Jet-based local feature description
collaborators: Sune Darkner, Anders L. Dahl & Kim S. Pedersen
image: /images/n_jets.png
excerpt:
    We develop a local feature descriptor using higher order image derivatives (aka. *image jets*). Our main finding is that this type of description is very competitive with traditional local feature description based on gradient orientation histograms (e.g. SIFT).
---

This project was the focus of my M.Sc. thesis. The main finding is that higher order image derivatives (aka. *image jets*) are competitive with traditional local feature descriptors based on gradient orientation histograms (e.g. SIFT). Moreover, image jets allow for a lower dimensional feature descriptor. We evaluate our descriptors on the [DTU Robot dataset][dtu_robot].

In my MSc thesis I have experimented with other angles to local feature description. Most notably, I have constructed a SIFT-like descriptor using the *locally orderless image* formulation and the *scale-space* framework.

## Publication
{% reference larsen2012jet %}
{% cite_details larsen2012jet %}
/ [PDF]({{ site.pubs_path }}/larsen2012jet.pdf)

## MSc thesis
{% reference larsen2012mscthesis %}
{% cite_details larsen2012mscthesis %}
/ [PDF]({{ site.pubs_path }}/larsen2012mscthesis.pdf)

## Software
I have a [Python implementation][dtu_robot] of the jet descriptors online in my [image processing/computer vision toolkit][ipcv].

For evaluating local feature descriptors, I recommend the Matlab framework [VLBenchmarks][vlbenchmarks].
I have [extended it][vlbenchmarks_dtu_robot] with an interface for the DTU Robot dataset.
**Beware**: There are plenty of evaluative studies of local feature descriptors in the literature. The conclusions of these studies often point in opposite directions. My experience is that the performance of local feature descriptors is very sensitive to the end-application and the data at hand. One should therefore be cautious when drawing conclusions across domains/datasets.


[dtu_robot]: http://roboimagedata.imm.dtu.dk/
[dtu_robot]: http://github.com/andersbll/ipcv/blob/master/ipcv/jetdescriptor.py
[ipcv]: http://github.com/andersbll/ipcv
[vlbenchmarks]: http://www.vlfeat.org/benchmarks/
[vlbenchmarks_dtu_robot]: http://github.com/andersbll/vlbenchmarks
