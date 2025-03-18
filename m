Return-Path: <keyrings+bounces-2463-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19920A671D3
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 11:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7C663AFFAB
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 10:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6CA2080C3;
	Tue, 18 Mar 2025 10:53:39 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C172066EF;
	Tue, 18 Mar 2025 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295219; cv=none; b=psKdv4OgNtXYWEXnbsm2FLGgPK4h57JjW0QMlC+sQGIE3ymIvNVPTqxn5ESpezRzvppDJ0UtI55Q/e0SpreBvMNoqiJ4qLh5wEkxVYzvYJa2b2V43ipO6pIsMl8Vd1680QX7b/Md4zXP0KTV7oK252XETzJq4sauaWZc8ev2W3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295219; c=relaxed/simple;
	bh=SGybYdnHDipNR4n7EgqZc3WC2xDhL+Q6SF95rsycQWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqBP0HiJaob1tzyPpolyo59otK+cMGaSXIZFS4/X15syfRYvyaQtJN703tSFNx36SSXn8vyVPBKxvZQvPDpQknZDw2FNmg7LvLvPJ5zFsF8Exw7z9J1BRQnkiJ6n07qSLDbgQIbX8wrr9w/mSvTDmdKPUgSeruvZQcqHKEzfy1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8Bx63GoUNlnUIibAA--.875S3;
	Tue, 18 Mar 2025 18:53:28 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMDxesSgUNlnrp1RAA--.20743S2;
	Tue, 18 Mar 2025 18:53:28 +0800 (CST)
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
Subject: [PATCH 6.1&6.6 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Tue, 18 Mar 2025 18:53:05 +0800
Message-ID: <20250318105308.2160738-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxesSgUNlnrp1RAA--.20743S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWDAF48AF4xtw18AFy5trc_yoW5Wr13pa
	43A343K348XrnrWwnxtw4rWr13ZrWkGw18ZrnrGw4rGa1UAFy0vr1jqF4Fka4xJryrtr1a
	qa4jqas0gr1rAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
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


