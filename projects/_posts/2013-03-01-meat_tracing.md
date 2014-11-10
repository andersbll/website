---
layout: project
title: Visual recognition for product tracking in slaughterhouses
collaborators: Marchen S. Hviid, Mikkel E. Jørgensen, Rasmus Larsen & Anders L. Dahl
image: /images/loins.jpg
excerpt:
    Using off-the-shelf computer vision methods we demonstrate a system for recognizing meat cuts at different points along a slaughterhouse production line. Our results shows that the suggested approach is a promising alternative to the more intrusive methods currently available.
---

## Abstract
Meat traceability is important for linking process and quality parameters from the individual meat cuts back to the production data from the farmer that produced the animal.
Current tracking systems rely on physical tagging, which is too intrusive for individual meat cuts in a slaughterhouse environment.
In this article, we demonstrate a computer vision system for recognizing meat cuts at different points along a slaughterhouse production line.
More specifically, we show that 211 pig loins can be identified correctly between two photo sessions.
The pig loins undergo various perturbation scenarios (hanging, rough treatment and incorrect trimming) and our method is able to handle these perturbations gracefully.
This study shows that the suggested vision-based approach to tracking is a promising alternative to the more intrusive methods currently available.

## Publication
{% reference larsen2014traceability %}
[PDF]({{ site.pubs_path }}/larsen2014traceability.pdf)
{% cite_details larsen2014traceability %}

## Software
The code is [available][code]. Warning: This was one of my first forays into computer vision programming with Python!


[code]: http://github.com/andersbll/meat_tracing
