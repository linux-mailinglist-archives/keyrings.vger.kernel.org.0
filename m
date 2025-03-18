Return-Path: <keyrings+bounces-2467-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6610A6720D
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 12:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7616A3A544F
	for <lists+keyrings@lfdr.de>; Tue, 18 Mar 2025 11:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CF7209F50;
	Tue, 18 Mar 2025 11:01:49 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B24209F4A;
	Tue, 18 Mar 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742295709; cv=none; b=HBtxoGIVAYSauZl0VJ8TFc6ko4zPEWSkhpGWNSRufGNIOtcgoAK6RGXNf5H+M+QH9v+CxvT+nERtAE+Oryiotq+fgF2HdyuFKwWctELHZZMqkgxazGa8tiboVi6zbe5GYi/ln/LxVcqVGelQrN4Me/kWABcGr9OKrym+AZxWX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742295709; c=relaxed/simple;
	bh=B8AxvSYWrkbmWWnreNpxz0LYzaanx/fwOmkSd+ULH7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwbpBBPA9jGLp52quDmHO2233HRp9ep5Dll3qBdjnCKcGJufYGSy3/KF7Zt6lk3J8ZDhwoJuAwH8zvgOvsGK4GMYw6hV+RU02qZzo8PS2xmDPcJvHRYmZTPtcPzTj1cx0zWN2hxNDvsj2jDWrt+V6tPKKqDMHi32D5gBGVv76KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8Bx12mWUtlnjIqbAA--.825S3;
	Tue, 18 Mar 2025 19:01:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMDxDceOUtlnb6FRAA--.22930S2;
	Tue, 18 Mar 2025 19:01:41 +0800 (CST)
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
Subject: [PATCH 6.1&6.6 V2 0/3] sign-file,extract-cert: switch to PROVIDER API for OpenSSL >= 3.0
Date: Tue, 18 Mar 2025 19:01:21 +0800
Message-ID: <20250318110124.2160941-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxDceOUtlnb6FRAA--.22930S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFWDAF48AF4xtw18AFy5trc_yoW5WrWrpa
	43A343K348XrnrWwnxtw4rWr13ZrWkGw18ZrsrGw4rGa1UAFy0vr1jvF4Fka4xJryrtr1a
	qa42qas0gr1rAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUt529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3
	AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b1UUUUUUUU=

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


