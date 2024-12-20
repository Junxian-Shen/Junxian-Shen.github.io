---
title: "Gringotts: Fast and Accurate Internal Denial‐of‐Wallet Detection for Serverless Computing"
collection: publications
category: conferences
permalink: /publication/2022-gringotts
excerpt: '<b><u>Junxian Shen</u></b>, Han Zhang, Yantao Geng, Jiawei Li, Jilong Wang, Mingwei Xu'
date: 2022-11-07
venue: 'CCS 22: Proceedings of the 2022 ACM SIGSAC Conference on Computer and Communications Security'
slidesurl: 'http://junxian-shen.github.io/files/Gringotts_CCS_presentation.pdf'
paperurl: 'https://junxian-shen.github.io/files/Gringotts_CCS.pdf'
---

Serverless computing, or Function-as-a-Service, is gaining continuous popularity due to its pay-as-you-go billing model, flexibility, and low costs. These characteristics, however, bring additional security risks, such as the Denial-of-Wallet (DoW) attack, to serverless tenants. In this paper, we perform a real-world DoW attack on commodity serverless platforms to evaluate its severity. To identify such attacks, we design, implement, and evaluate Gringotts, an accurate, easy-to-use DoW detection system with a negligible performance overhead. Gringotts addresses the information ambiguity inherent in serverless functions by introducing a well-designed performance metrics collection agent. Then, Gringotts uses the Mahalanobis distance to discover anomalies in the distribution of the metrics. We implement Gringotts as a real system and conduct extensive experiments using a testbed to evaluate the performance of Gringotts. Our results indicate that Gringotts has a performance overhead of less than 1.1%, with an average detection delay of 1.86 seconds and an average accuracy of over 95.75%.