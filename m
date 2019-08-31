Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BEFA433E
	for <lists+keyrings@lfdr.de>; Sat, 31 Aug 2019 10:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfHaIT6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 31 Aug 2019 04:19:58 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:33159 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726116AbfHaIT6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 31 Aug 2019 04:19:58 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04446;MF=wuyihao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0TawCUa4_1567239595;
Received: from ali-186590dcce93-2.local(mailfrom:wuyihao@linux.alibaba.com fp:SMTPD_---0TawCUa4_1567239595)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 31 Aug 2019 16:19:56 +0800
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     Jia Zhang <zhang.jia@linux.alibaba.com>, keyrings@vger.kernel.org
From:   Yihao Wu <wuyihao@linux.alibaba.com>
Subject: [PATCH 0/2] Detect and overwrite existing signature
Message-ID: <fbc3db40-9633-9c20-1ef6-ec8cbb514e01@linux.alibaba.com>
Date:   Sat, 31 Aug 2019 16:20:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Currently, sign-file directly signs on a kernel module without checking
if there's already one signature. This patch set makes sign-file aware
of the existing signature. And it allows the user to cope with it. 

Yihao Wu (2):
  sign-file: introduce check_module_sig
  sign-file: detect existing signature and handle it

 scripts/sign-file.c | 118 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 108 insertions(+), 10 deletions(-)

--
2.21.0
