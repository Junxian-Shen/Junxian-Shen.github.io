---
title: "Network‐Centric Distributed Tracing with DeepFlow: Troubleshooting Your Microservices in Zero Code"
collection: publications
category: conferences
permalink: /publication/2023-deepflow
excerpt: '<b><u>Junxian Shen</u></b>, Han Zhang, Yang Xiang, Xingang shi, Xinrui Li, Yunxi Shen, Zijian Zhang, Yongxiang Wu, Xia Yin, Jilong Wang, Mingwei Xu, Yahui Li, Jiping Yin, Jianchang Song, Zhuofeng Li, Runjie Nie'
date: 2023-09-01
venue: 'ACM SIGCOMM 23: Proceedings of the ACM SIGCOMM 2023 Conference'
slidesurl: 'http://junxian-shen.github.io/files/DeepFlow_SIGCOMM_presentation.pdf'
paperurl: 'https://junxian-shen.github.io/files/DeepFlow_SIGCOMM.pdf'
---

Microservices are becoming more complicated, posing new challenges for traditional performance monitoring solutions. On the one hand, the rapid evolution of microservices places a significant burden on the utilization and maintenance of existing distributed tracing frameworks. On the other hand, complex infrastructure increases the probability of network performance problems and creates more blind spots on the network side. In this paper, we present DeepFlow, a network-centric distributed tracing framework for troubleshooting microservices. DeepFlow provides out-of-the-box tracing via a network-centric tracing plane and implicit context propagation. In addition, it eliminates blind spots in network infrastructure, captures network metrics in a low-cost way, and enhances correlation between different components and layers. We demonstrate analytically and empirically that DeepFlow is capable of locating microservice performance anomalies with negligible overhead. DeepFlow has already identified over 71 critical performance anomalies for more than 26 companies and has been utilized by hundreds of individual developers. Our production evaluations demonstrate that DeepFlow is able to save users hours of instrumentation efforts and reduce troubleshooting time from several hours to just a few minutes.