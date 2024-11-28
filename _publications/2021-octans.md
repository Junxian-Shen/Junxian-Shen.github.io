---
title: "Octans: Optimal Placement of Service Function Chains in Many‐Core Systems"
collection: publications
category: manuscripts
permalink: /publication/2021-octans
excerpt: 'Heng Yu, Zhilong Zheng, <b><u>Junxian Shen</u></b>, Congcong Miao, Chen Sun, Hongxin Hu, Jun Bi, Jianping Wu, Jilong Wang'
date: 2021-03-03
venue: 'IEEE Transactions on Parallel and Distributed Systems ( Volume: 32, Issue: 9, 01 September 2021)'
# slidesurl: 'http://academicpages.github.io/files/slides1.pdf'
paperurl: 'https://junxian-shen.github.io/files/Octans_TPDS.pdf'
---

Network Function Virtualization (NFV) offers service delivery flexibility and reduces overall costs by running service function chains (SFCs) on commodity servers with many cores. Existing solutions for placing SFCs in one server treat all CPU cores as equal and allocate isolated CPU cores to network functions (NFs). However, advanced servers often adopt Non-Uniform Memory Access (NUMA) architecture to improve the scalability of many-core systems. CPU cores are grouped into nodes, incurring performance degradation due to cross-node memory access and intra-node resource contention. Our evaluation shows that randomly selecting cores to place NFs in an SFC could suffer from 39.2 percent lower throughput comparing to an optimal placement solution. In this article, we propose Octans, an NFV orchestrator to achieve maximum aggregate throughput of all SFCs in many-core systems. Octans first formulates the optimization problem as a Non-Linear Integer Programming (NLIP) Model. Then we identify the key factor for problem solving as evaluating the throughput drop of an NF caused by other NFs in the same SFC or different SFCs, i.e., performance drop index, and propose a formal and accurate prediction model based on system level performance metrics. Finally, we propose two online algorithms to quickly find near-optimal placement solutions for one-time and incremental deployment. Extensive evaluation on a prototype implementation shows that Octans significantly improves the aggregate throughput comparing to two state-of-the-art placement solutions by 27.1 ~ 45.2 percent for one-time deployment and by 20.9 ~ 38.1 percent for incremental deployment, with very low prediction errors. Moreover, Octans could quickly find a near-optimal placement solution with tiny optimality gap.