---
title: "Serpens: A High‐Performance Serverless Platform for NFV"
collection: publications
category: conferences
permalink: /publication/2020-serpens
excerpt: '<b><u>Junxian Shen</u></b>, Heng Yu, Zhilong Zheng, Chen Sun, Mingwei Xu, Jilong Wang'
date: 2020-06-15
venue: '2020 IEEE/ACM 28th International Symposium on Quality of Service (IWQoS)'
# slidesurl: 'http://academicpages.github.io/files/slides1.pdf'
paperurl: 'https://junxian-shen.github.io/files/Serpens_IWQoS.pdf'
---

Many enterprises run Network Function Virtualization (NFV) services on public clouds to relieve management burdens and reduce costs. However, NFV operators still face the burden of choosing the right types of virtual machines (VMs) for various network functions (NFs), as well as the cost of renting VMs at a granularity of months or years while many VMs remain idle during valley hours. A recent computing model named serverless computing automatically executes user-defined functions on requests arrival, and charges users based on the number of processed requests. For NFV operators, serverless computing has the potential of completely relieving NF management burden and significantly reducing costs. Nevertheless, naively exploring existing serverless platforms for NFV introduces significant performance overheads in three aspects, including high remote state access latency, long NF launching time, and high packet delivery latency between NFs. To address these problems, we propose Serpens, a high-performance serverless platform for NFV. Firstly, Serpens designs a novel state management mechanism to support local state access. Secondly, Serpens proposes an efficient NF execution model to provide fast NF launching and avoid extra packet delivery. We have implemented a prototype of Serpens. Evaluation results demonstrate that Serpens could significantly improve performance for NFs and service function chains (SFCs) comparing to existing serverless platforms.