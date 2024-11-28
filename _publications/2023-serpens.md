---
title: "Serpens: A High Performance FaaS Platform for Network Functions"
collection: publications
category: manuscripts
permalink: /publication/2023-serpens
excerpt: 'Heng Yu, Han Zhang, <b><u>Junxian Shen</u></b>, Yantao Geng, Jilong Wang, Congcong Miao, Mingwei Xu'
date: 2023-03-30
venue: 'IEEE Transactions on Parallel and Distributed Systems ( Volume: 34, Issue: 8, August 2023)'
# slidesurl: 'http://academicpages.github.io/files/slides1.pdf'
paperurl: 'https://junxian-shen.github.io/files/Serpens_TPDS.pdf'
---

More and more enterprises deploy applications on Function-as-a-Service (FaaS) platforms to improve resource efficiency and save monetary costs. Network Functions (NFs) suffer from staggered peaks of traffic patterns and could benefit from fine-grained resource multiplexing in FaaS platform. However, naively exploring existing FaaS platforms to support NFs can introduce significant performance overheads in three aspects, including slow instance startup, remote state access for NFs, and costly packet delivery between NFs. To address these problems, we propose Serpens , a high performance FaaS platform for NFs. First, Serpens proposes a reusable NF runtime design to slash instance startup overhead. Second, Serpens designs a novel state management mechanism to support local state access. Third, Serpens introduces an advanced service chaining approach to avoid extra packet delivery. Besides, Serpens designs an NF scaling mechanism to minimize performance fluctuation. We have implemented a prototype of Serpens and conducted comprehensive experiments. Compared with the NFs and Service Function Chains (SFCs) that run on existing FaaS platforms, Serpens can improve the throughput by more than 10× and reduce the latency by more than 90%.