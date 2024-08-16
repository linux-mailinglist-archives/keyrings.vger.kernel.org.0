Return-Path: <keyrings+bounces-1880-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC84954869
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 13:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEDB91C209EE
	for <lists+keyrings@lfdr.de>; Fri, 16 Aug 2024 11:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AC31AD41D;
	Fri, 16 Aug 2024 11:59:43 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D8215B12C
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723809582; cv=none; b=rVIB5nVzhmXz3O8lTpaJPG/EqISWr4mMxzxg0pQpwbQcZcEIXfW3sQbWqIZ9MqZlHif9aZYkwSF387DzpVGjii91WsI5fAXuC8QjfKNqsZXkRHiQKSN4c49im3BXN+yHWJAEmMnlqLJqH937U33yEFJauL/qFeUl63dgg+2Z78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723809582; c=relaxed/simple;
	bh=ZnwYwisPyZoW6NrsmdwW0wAIIerlMCj0XDg52HUktGo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 MIME-Version:Date; b=QBPNkz1Y7YqtJF3hKMIu0+QubDXQl0s3U61sO2x374+M73JUQPff0oeXaPbMiw+ghKIEC5jpK+S9+P0Azmmg1ElklB2szGDsOKdDafBf0XPPP4nyMqXdUSjMU3q++DwdPJvG2eBH8b5I8iQceDaWxqPmkIdgFl5C4lcJ7H/PBNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wlfl62YZQz9v7Hk
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 19:24:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id F01DF140590
	for <keyrings@vger.kernel.org>; Fri, 16 Aug 2024 19:42:51 +0800 (CST)
Received: from [127.0.0.1] (unknown [10.204.63.22])
	by APP2 (Coremail) with SMTP id GxC2BwCnxME0O79mqLNPAQ--.60183S2;
	Fri, 16 Aug 2024 12:42:50 +0100 (CET)
Message-ID: <ddc266b6f275438425b206a35760f827b7892c24.camel@huaweicloud.com>
Subject: Re: PGP signature patches
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
In-Reply-To: <2493611.1723748374@warthog.procyon.org.uk>
References: <2493611.1723748374@warthog.procyon.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 16 Aug 2024 13:42:26 +0200
User-Agent: Evolution 3.44.4-0ubuntu2 
X-CM-TRANSID:GxC2BwCnxME0O79mqLNPAQ--.60183S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw15try3KF1xury3JF17GFg_yoWDJrXEgr
	1vqryfC3s8tw4Sva10yF13trsay3y7Zas0qryrJwn7Zry3Jws3XwsIkrySqw1fGa9a9Fy5
	urZ5Xws0v3ZIqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQARBGa+tXAJFgAAsW

On Thu, 2024-08-15 at 19:59 +0100, David Howells wrote:
> Hi Roberto,
>=20
> I've found another use for the PGP patches: modern Lenovo laptops have an=
 EFI
> variable containing a list of allowed keys - but they're in PGP form, not
> X.509.  So we're going to need a PGP parser to cope with that.
>=20
> I would like to look at getting the patches into linux-next at least, aim=
ing
> at the next merge window.  Do you still have a reasonably up-to-dateish b=
ranch
> with them on?

Hi David

that is a great news!

The kernel patch set is still the one I sent some time ago:

https://lore.kernel.org/linux-integrity/20220111180318.591029-1-roberto.sas=
su@huawei.com/

At the end of the cover letter, there is also a link with the diff from
the version you wrote.

Compared to your patches, I also added support for keyring restriction
by signature (patch 10). For that, I also need to search a key with a
partial ID (patch 9). These two patches can be dropped for now, if you
want.

Thanks

Roberto


