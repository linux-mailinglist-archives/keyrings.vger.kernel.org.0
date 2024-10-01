Return-Path: <keyrings+bounces-2174-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2698B81B
	for <lists+keyrings@lfdr.de>; Tue,  1 Oct 2024 11:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B88E1F23105
	for <lists+keyrings@lfdr.de>; Tue,  1 Oct 2024 09:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D2619D894;
	Tue,  1 Oct 2024 09:17:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8B156C4D;
	Tue,  1 Oct 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727774245; cv=none; b=LAn8YHZtjkP5IPY4imbnMrh7Bp5kC5i2MyAlCIhT6rtJZZSfUDjjbWsVaPDgsJoi99HrEEBrFLKuEyM9bsEFDaw9tyJD7NAI98IvYEBkWi5LeMVZY9oHEXOs/RgzRYtGWSuZIMZBDPpcyRECfv4m+PILyR9deS8D+tIOGFc1Vyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727774245; c=relaxed/simple;
	bh=Svfo0+CJ5fp0FFu0PWEawg5jgBrmgSL3AB7+TqvSeUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp23m8iwZSn7yow2tiVr4NxZqGSCkIy+wC8UY8wYWWTRSg3/PYkJ0Xd5ja2nnshQq2xpsxSkqYJl7jrJ6k529BRsKzM4tfOhz7XthQGgRXkLJLDM6nDfzNrI4u/pmrwQ8udB7RNwipl6ko+ukYdBQlTIuF/Rfbz0XvEJqVQ2dA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id A75BC30008F12;
	Tue,  1 Oct 2024 11:17:13 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 89069230E25; Tue,  1 Oct 2024 11:17:13 +0200 (CEST)
Date: Tue, 1 Oct 2024 11:17:13 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-security-module@vger.kernel.org,
	Gonglei <arei.gonglei@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev,
	zhenwei pi <pizhenwei@bytedance.com>,
	lei he <helei.sig11@bytedance.com>,
	Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeff ery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Subject: Re: [PATCH v2 00/19] Migrate to sig_alg and templatize ecdsa
Message-ID: <Zvu-GV-vtDJHKf51@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>

Hi Herbert,

On Tue, Sep 10, 2024 at 04:30:10PM +0200, Lukas Wunner wrote:
> The original impetus of this series is to introduce P1363 signature
> decoding for ecdsa (patch [18/19]), which is needed by the upcoming
> SPDM library (Security Protocol and Data Model) for PCI device
> authentication.
> 
> To facilitate that, move X9.62 signature decoding out of ecdsa.c and
> into a template (patch [15/19]).
> 
> New in v2:  Move the maximum signature size calculations for ecdsa
> out of software_key_query() and into the X9.62 template so that
> corresponding calculations can be added for P1363 without further
> cluttering up software_key_query() (patch [16/19] - [17/19]).
> 
> New in v2:  Avoid inefficient copying from kernel buffers to sglists
> in the new templates by introducing a sig_alg backend and migrating
> all algorithms to it, per Herbert's advice (patch [02/19] - [12/19]).
> 
> Clean up various smaller issues that caught my eye in ecdsa
> (patch [01/19] and [14/19]), ecrdsa (patch [19/19]) and
> ASN.1 headers (patch [13/19]).

This series was submitted at the tail end of the v6.11 cycle.
It still applies cleanly to v6.12-rc1 though, so I'm not sure
whether to resubmit.

Is there anything you want me to change?

Thanks!

Lukas

