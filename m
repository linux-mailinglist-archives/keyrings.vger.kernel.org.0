Return-Path: <keyrings+bounces-2478-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E47A68527
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 07:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43988423FEB
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 06:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECA7212B0E;
	Wed, 19 Mar 2025 06:40:50 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830E1211486;
	Wed, 19 Mar 2025 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742366450; cv=none; b=MIG+L8BtViAhK+C8AlpLOiFweqKnOU9Dxpc1egmr3P0wpL4gefBZtr5A+vAJDoQMO78q45A9UZu0Tw+ELX5fUTzJraD6dg8x8ihOeOA6akm+usFogdUUQCu9ZU7JagYgki4FZtqSupIi24RB6crhQb5075FyIdllBlgYKdtPLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742366450; c=relaxed/simple;
	bh=/aEEy+gIDGW5SguKqslciYWm93LWoxpc6RsLUFr5Ju4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRYgaC3Qfm8uyoMnh2bZPK3lp26BgZ8RFHeRald9eHSpvi0xps9FChovmgbr7KN4ms4Vz8aDG50tos1o2vV3EkUaKUg87ivL5bRhPCi822BdfbBHOAeE0l0C7lIH/BIw/ZD/pmPaZTu5r1EHr7dzDVcIxzRN+4z4h+PUulUyRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8DxzOLsZtpnnr2cAA--.2683S3;
	Wed, 19 Mar 2025 14:40:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMAxHsfoZtpnCTFTAA--.22672S2;
	Wed, 19 Mar 2025 14:40:43 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.1&6.6 V3 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Wed, 19 Mar 2025 14:40:28 +0800
Message-ID: <20250319064031.2971073-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxHsfoZtpnCTFTAA--.22672S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWDAF48AF4xtw18AFy5trc_yoW5WFyUpa
	43A343K348XrnrWwnxtw4rWr13ZrWkGw18ZrsrGw4rGa1UAFy0vr1jvF4Fka4xJryrtr1a
	qa42qas0gr1rAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUUUU=

Backport this series to 6.1&6.6 because we get build errors with GCC14
and OpenSSL3 (or later):

certs/extract-cert.c: In function 'main':
certs/extract-cert.c:124:17: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  124 |                 ENGINE_load_builtin_engines();
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
certs/extract-cert.c:126:21: error: implicit declaration of function 'ENGINE_by_id' [-Wimplicit-function-declaration]
  126 |                 e = ENGINE_by_id("pkcs11");
      |                     ^~~~~~~~~~~~
certs/extract-cert.c:126:19: error: assignment to 'ENGINE *' {aka 'struct engine_st *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
  126 |                 e = ENGINE_by_id("pkcs11");
      |                   ^
certs/extract-cert.c:128:21: error: implicit declaration of function 'ENGINE_init' [-Wimplicit-function-declaration]
  128 |                 if (ENGINE_init(e))
      |                     ^~~~~~~~~~~
certs/extract-cert.c:133:30: error: implicit declaration of function 'ENGINE_ctrl_cmd_string' [-Wimplicit-function-declaration]
  133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
      |                              ^~~~~~~~~~~~~~~~~~~~~~
certs/extract-cert.c:64:32: note: in definition of macro 'ERR'
   64 |                 bool __cond = (cond);                   \
      |                                ^~~~
certs/extract-cert.c:134:17: error: implicit declaration of function 'ENGINE_ctrl_cmd' [-Wimplicit-function-declaration]
  134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
      |                 ^~~~~~~~~~~~~~~

In theory 5.4&5.10&5.15 also need this, but they need more efforts because
file paths are different.

The ENGINE interface has its limitations and it has been superseded
by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
Some distros have started removing it from header files.

Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >= 3.

Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11-0.4.12-4
and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comparing that
the result is identical.

V1 -> V2:
Add upstream commit id.

V2 -> V3:
Add correct version id.

Jan Stancek (3):
  sign-file,extract-cert: move common SSL helper functions to a header
  sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
  sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

Signed-off-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 MAINTAINERS          |   1 +
 certs/Makefile       |   2 +-
 certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
 scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
 scripts/ssl-common.h |  32 ++++++++++
 5 files changed, 178 insertions(+), 129 deletions(-)
 create mode 100644 scripts/ssl-common.h
---
2.27.0


