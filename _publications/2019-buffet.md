---
title: "Buffet: Enabling Multi‐Tenant Network Functions"
collection: publications
category: conferences
permalink: /publication/2019-buffet
excerpt: 'Heng Yu, <b><u>Junxian Shen</u></b>, Chen Sun, Zhilong Zheng, Jilong Wang'
date: 2019-09-13
venue: '2019 IEEE Global Communications Conference (GLOBECOM)'
# slidesurl: 'http://academicpages.github.io/files/slides1.pdf'
paperurl: 'https://junxian-shen.github.io/files/Buffet_GLOBECOM.pdf'
---

Many enterprises outsource traffic processing to third-party Network Function (NF) service providers to relieve management burden and reduce cost. NF providers have to process packets from multiple tenants simultaneously. However, most existing software based NFs are designed for one single tenant without internal state isolation mechanisms. These NFs cannot be securely shared across multiple tenants. Existing solutions that support multitenancy are either inefficient or ad-hoc for specific NFs. In this paper, we propose Buffet, a general and efficient framework that enables multitenancy for a wide range of NFs. First, Buffet introduces a general programming abstraction for various NFs to relieve NF developers from considering isolation details. Second, Buffet proposes dynamic tenant-level affinity to achieve high performance and resource efficiency. Finally, Buffet exploits SmartNIC offloading to eliminate host CPU overhead. We have implemented a prototype of Buffet. Evaluation results demonstrate that Buffet can effectively enable multitenancy for a wide range of NFs with high performance and resource efficiency.