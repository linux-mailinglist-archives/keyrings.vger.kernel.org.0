Return-Path: <keyrings+bounces-1881-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B43954879
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 14:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD15EB22CD1
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C1617920E;
	Fri, 16 Aug 2024 12:02:47 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286041A01BF
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723809767; cv=none; b=ceygpgo3XOpiN2zjWICeY+hD9OSCLJKax40p050MXA+z3JnnsQCGYtVDpCKFhJyzue6xeZ2Q4681DPKSQIdlxAWjs4Y++pjN/GvqsboMdXbPHwVm/YCnPAg8jueMxmZ3252zG1szOIrVp4nkEbPJucTuWeg0/9JoVqM0OHWZRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723809767; c=relaxed/simple;
	bh=AQZbj78peNRHwhEwrH+s01an1ed2X66kdwsyDUGA9Ek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LH7fFzyuNIa6eXBYled5f15jOHfWReBi0EFzYAvVsUrfpqYsVnBm6dmj7hyCvsy3FvSNGOek6+B3DZA2Hi0pwde+2miqQBRTVddqAO66jamZi+FHpysaPv2jpvJl/HzbfQLHlc4EnPKHJHfE3E/aBfUQWwZwZZFNrYXrmofHqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4WlfnT6FV9z9v7NJ
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 19:26:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 12241140518
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 19:44:56 +0800 (CST)
Received: from [127.0.0.1] (unknown [10.204.63.22])
	by APP2 (Coremail) with SMTP id GxC2BwBnhMGzO79m8rlPAQ--.59319S2;
	Fri, 16 Aug 2024 12:44:55 +0100 (CET)
Message-ID: <603342f05550c96ecb6f10362ea27ea8ac09b0af.camel@huaweicloud.com>
Subject: Re: PGP signature patches
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
Date: Fri, 16 Aug 2024 13:44:49 +0200
In-Reply-To: <D3H8YIUZJ1ZV.2OM1ZTSQVJRXY@kernel.org>
References: <2493611.1723748374@warthog.procyon.org.uk>
	 <D3H8YIUZJ1ZV.2OM1ZTSQVJRXY@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:GxC2BwBnhMGzO79m8rlPAQ--.59319S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF43Zr1xXr4kZrykWr18uFg_yoW3uFg_Zr
	sY9a4xCwn8JrWfAw18ZF45Xrs7KFWjvF9rXrWrJ3ZrAFy5Jr1kXrsxCFySv3WfKrWxAr1U
	CFyUJr1vv3Z0qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbO8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267
	AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU1QVy3UUUUU==
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQARBGa+tXAJFwAAsX

On Fri, 2024-08-16 at 13:00 +0300, Jarkko Sakkinen wrote:
> On Thu Aug 15, 2024 at 9:59 PM EEST, David Howells wrote:
> > Hi Roberto,
> >=20
> > I've found another use for the PGP patches: modern Lenovo laptops have =
an EFI
> > variable containing a list of allowed keys - but they're in PGP form, n=
ot
> > X.509.  So we're going to need a PGP parser to cope with that.
> >=20
> > I would like to look at getting the patches into linux-next at least, a=
iming
> > at the next merge window.  Do you still have a reasonably up-to-dateish=
 branch
> > with them on?
>=20
> Is this possible to emulate with QEMU?

Unfortunately not, it is a trust anchor in the kernel. QEMU would need
to be added to the TCB, and made tamperproof against other user space
processes. Also, the PGP verification will be done from the very
beginning of the boot phase.

Thanks

Roberto


