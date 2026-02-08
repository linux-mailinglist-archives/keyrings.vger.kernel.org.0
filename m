Return-Path: <keyrings+bounces-4032-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5CwPMwyZiGkBsAQAu9opvQ
	(envelope-from <keyrings+bounces-4032-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 08 Feb 2026 15:09:16 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDE108E08
	for <lists+keyrings@lfdr.de>; Sun, 08 Feb 2026 15:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7EB243004DE5
	for <lists+keyrings@lfdr.de>; Sun,  8 Feb 2026 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416792F747D;
	Sun,  8 Feb 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sX4UAoqb"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C87E2561AA;
	Sun,  8 Feb 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770559753; cv=none; b=FgsWnhQk6+pYp6nPkAI91prdkIAohD9HtDeNng2MleGuf50ohEib+N8u2kD8I/qT9ee3oBIB7/TORsAdHnuqCB/eKs8G1ZoWylzT8KiNoXUXjTDqNMKb3xjn2CHC3yrUcWyVQKnkhGOrVq6SdwUeclmH/0d2ySukFejrAxJGe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770559753; c=relaxed/simple;
	bh=Y7VdEvB6KNDjDlcFT19MDaynWdFHk56AYryt43oMvP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFOOGqZ0RTBvKePIC8GANPboOYhjOnw29TddfMAkFUBQ/dSpmWES91vZ0+zbQoATi9dYt618lGoG9PD4p0JqyDIdk9fNb58uHHC9N4JY84ffSBu2idxXbDM/emQrSKrrtVEg3JlVz93JyVFC7GxgRo5kQ3eSReP595sg88cIYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sX4UAoqb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A5FC4CEF7;
	Sun,  8 Feb 2026 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770559753;
	bh=Y7VdEvB6KNDjDlcFT19MDaynWdFHk56AYryt43oMvP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sX4UAoqbaSdTs2rBzopjelmDvVRg4yWCfRa118M+UZXZaFx9EJqyMsX76GzCyPSZW
	 IWAK9aqWtzuWlRhiD9zc02liLD4tdRU7p8vH5H+NSegKHvV0cR34XPoGImqDKACpRK
	 BHCkNVtVOQbmX1lGvBdYu4IUT/1f2Jkp/vjHhAj+DsmhHm2weOV03FLG8D3G1avbzj
	 PdD+kQginaETJik04s/2r/xEJs/S1GDCcx4Nxjsj8elvHLXwCcXWKX7j8ygZCi0SIY
	 PWWXxGjKK8+JYjYVUAjKPpayftZqPFIWnY+ftxtsCAWEWRUXTbj7VNDZeynt13GJu2
	 dDaBbbrzOzkrQ==
Date: Sun, 8 Feb 2026 16:09:08 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-integrity@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"open list:KEYS-TRUSTED" <keyrings@vger.kernel.org>,
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 11/11] tpm-buf: Implement managed allocations
Message-ID: <aYiZBPN-st_4DlFH@kernel.org>
References: <20260125192526.782202-1-jarkko@kernel.org>
 <20260125192526.782202-12-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125192526.782202-12-jarkko@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4032-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49DDE108E08
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 09:25:21PM +0200, Jarkko Sakkinen wrote:
> From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
> 
> Decouple kzalloc from buffer creation, so that a managed allocation can be
> used:
> 
> 	struct tpm_buf *buf __free(kfree) buf = kzalloc(TPM_BUFSIZE,
> 							GFP_KERNEL);
> 	if (!buf)
> 		return -ENOMEM;
> 
> 	tpm_buf_init(buf, TPM_BUFSIZE);
> 
> Alternatively, stack allocations are also possible:
> 
> 	u8 buf_data[512];
> 	struct tpm_buf *buf = (struct tpm_buf *)buf_data;
> 	tpm_buf_init(buf, sizeof(buf_data));
> 
> This is achieved by embedding buffer's header inside the allocated blob,
> instead of having an outer wrapper.
> 
> Cc: Ross Philipson <ross.philipson@oracle.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Since rest of the series does not seem to move forward  maybe I should
rebase this to bottom and send it as a separate patch?

This patch eliminates a category of memory bugs and is that way useful.

It also starts to be pretty well stress tested.

BR, Jarkko

