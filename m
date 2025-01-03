Return-Path: <keyrings+bounces-2328-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67571A00D2F
	for <lists+keyrings@lfdr.de>; Fri,  3 Jan 2025 18:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417B23A2C66
	for <lists+keyrings@lfdr.de>; Fri,  3 Jan 2025 17:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0EE1FC7E2;
	Fri,  3 Jan 2025 17:47:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C9E1FA172;
	Fri,  3 Jan 2025 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735926421; cv=none; b=GhGnvuCzlvVHcOZVcPygz7YRpriNr3Pju2k9bMDrphVsKmfO/mhADgeju1YciRLzuiOvQc/ddLsnoObvW+k0azNfDv3V4WX39LNgv4rlczK5VBrugN47CRyVLkj7lwD54Z2XaoF6KV1i2KdCNknDOlmShPyzPjdiisfNJdj+rOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735926421; c=relaxed/simple;
	bh=ayCl4mXUhD/JImIhYGfZzEacl+66InFlZ4DcOEPv3u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COjMckUykbvMq0cfdTaT0Fy/v4hxfwyg5fAoAsmRV/etvN7cg8hlp0JTc+1EbL4ZodXr84o9BonCtOedl2CCzl8FGAIBAFXEW+mE9P1RAIYj9bDhwqQiC85JwdVhvR8czxYAmr5AiiPsj/97I7yrxhof+0WSEIO1jJpQhRxvGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id B2E2E101E699C;
	Fri,  3 Jan 2025 18:38:07 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 6BEB861589AE;
	Fri,  3 Jan 2025 18:38:07 +0100 (CET)
Date: Fri, 3 Jan 2025 18:38:06 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z3ggfuaY9WgApXbW@wunner.de>
References: <cover.1735236227.git.lukas@wunner.de>
 <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
 <b8d40d86-21b5-40c6-89c7-3d792e3a791c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d40d86-21b5-40c6-89c7-3d792e3a791c@linux.ibm.com>

On Thu, Jan 02, 2025 at 12:45:47PM -0500, Stefan Berger wrote:
> On 12/26/24 1:08 PM, Lukas Wunner wrote:
> > When user space issues a KEYCTL_PKEY_QUERY system call for a NIST P521
> > key, the key_size is incorrectly reported as 528 bits instead of 521.
> 
> Is there a way to query this with keyctl pkey_query?

Yes, these are the commands I've used for testing:

  id=`keyctl padd asymmetric "" %:_uid.0 < end_responder.cert.der`
  keyctl pkey_query $id 0 enc=x962 hash=sha256

This is the certificate I've used:

  https://github.com/DMTF/libspdm/raw/refs/heads/main/unit_test/sample_key/ecp521/end_responder.cert.der

Before:

  key_size=528
  max_data_size=64
  max_sig_size=139
  max_enc_size=66
  max_dec_size=66
  encrypt=n
  decrypt=n
  sign=n
  verify=y

After:

  key_size=521
  max_data_size=64
  max_sig_size=139
  max_enc_size=0
  max_dec_size=0
  encrypt=n
  decrypt=n
  sign=n
  verify=y

Thanks,

Lukas

