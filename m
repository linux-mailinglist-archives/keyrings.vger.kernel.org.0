Return-Path: <keyrings+bounces-1884-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF7955CB7
	for <lists+keyrings@lfdr.de>; Sun, 18 Aug 2024 15:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C926A1F214BF
	for <lists+keyrings@lfdr.de>; Sun, 18 Aug 2024 13:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C61B219E1;
	Sun, 18 Aug 2024 13:18:16 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7B1B978
	for <keyrings@vger.kernel.org>; Sun, 18 Aug 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723987096; cv=none; b=lXz3a3bj4m9g7ZMGJC69IW2JO/iF4Btp3P0PCUaaaVxJ5kI3cqn+nvu/xS3QS/WiptCfIVrOt257hJuYk/p1YNIa12XWwP670ro3AtXJU6JQBqBR3x57MVZtTGEBy2YHMt+bpKcesvasC1SLG/ivwXHsQzp8/B3zVsLFVK0Ffcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723987096; c=relaxed/simple;
	bh=JTYd3luilgFncoYX9QcWhiHpDxSWoX4LUN/45dme9cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ve388DjXdpcoUurU6uj5pJt7n3EGdbhDvUdc7DQSMox6VnxpmkcKuoGYZoIqjOsLlJtHA5VinZ+UVmhzmSnhyEKRqEU59Rpv2IKomM6drXEHSqKRtOV0ICpoEV16ueSRb1hTjRK5174mbp9Uj6EmLZoh0Mk6jY9nCJHJNrog+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4WmwdV121cz9v7JM
	for <keyrings@vger.kernel.org>; Sun, 18 Aug 2024 20:53:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id F0A701401F0
	for <keyrings@vger.kernel.org>; Sun, 18 Aug 2024 21:17:58 +0800 (CST)
Received: from [10.45.153.54] (unknown [10.45.153.54])
	by APP2 (Coremail) with SMTP id GxC2BwDnA8F+9MFmwgByAQ--.19125S2;
	Sun, 18 Aug 2024 14:17:58 +0100 (CET)
Message-ID: <9d835c9f-313a-4007-9513-28fff3bfec71@huaweicloud.com>
Date: Sun, 18 Aug 2024 15:17:47 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PGP signature patches
To: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
References: <ddc266b6f275438425b206a35760f827b7892c24.camel@huaweicloud.com>
 <2493611.1723748374@warthog.procyon.org.uk>
 <3081109.1723842611@warthog.procyon.org.uk>
Content-Language: en-US
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
In-Reply-To: <3081109.1723842611@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwDnA8F+9MFmwgByAQ--.19125S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5P7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjc
	xK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
	JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQATBGbBWHEBdwACss

On 8/16/2024 11:10 PM, David Howells wrote:
> I've pulled your patches up to v6.11-rc3:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=pgplib

Thanks. I also found some bug fixes from openEuler 22.03 LTS
(the PGP patch set was already merged there).

Will send a new version of the patch set shortly.

Roberto


