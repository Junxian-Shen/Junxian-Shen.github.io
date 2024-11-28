---
title: "Scorpius: Proactive Code Preparation to Accelerate Function Startup"
collection: publications
category: conferences
permalink: /publication/2022-scorpius
excerpt: 'Heng Yu, <b><u>Junxian Shen</u></b>, Han Zhang, Jilong Wang, Congcong Miao, Mingwei Xu'
date: 2022-06-10
venue: '2022 IEEE/ACM 30th International Symposium on Quality of Service (IWQoS)'
# slidesurl: 'http://academicpages.github.io/files/slides1.pdf'
paperurl: 'https://junxian-shen.github.io/files/Scorpius_IWQoS.pdf'
---

Massive enterprises deploy their applications on public clouds to relieve infrastructure management burden. However, applications are faced with highly fluctuating workloads, while clouds provision exclusive resources at coarse time granularity, resulting in severely low resource efficiency. Function-as-a-Service (FaaS) platform enables fine-grained resource multiplexing, which has the potential to improve efficiency. However, FaaS platforms could consume several seconds to start functions and the long startup latency can severely hurt the performance of applications. In this paper, we measure the FaaS platforms and find that most startup latency is occupied by code preparation. To reduce the code preparation latency with little resource overhead, we propose Scorpius, a FaaS platform that proactively prepares code based on the historical data of functions. It combines two optimization categories: (1) To reduce the code size, Scorpius proposes to proactively prepare partial libraries over servers and run functions on the server with most library sharing. (2) To advance the start time, Scorpius proposes to predict the function overload with a simple model and proactively scale code to more servers. We have implemented a prototype of Scorpius and conducted extensive experiments. Evaluation results demonstrate that compared with state-of-the-art methods, Scorpius can reduce the code preparation latency by 87.6% with only 9.3% storage overhead.