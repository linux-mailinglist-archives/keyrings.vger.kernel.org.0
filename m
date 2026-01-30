Return-Path: <keyrings+bounces-3976-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE9tBhGVfGkQNwIAu9opvQ
	(envelope-from <keyrings+bounces-3976-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 12:25:05 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77368BA0A7
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 12:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809A8301176F
	for <lists+keyrings@lfdr.de>; Fri, 30 Jan 2026 11:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D1A367F28;
	Fri, 30 Jan 2026 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAbo0KdU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TOlX2r+l"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3973590CD
	for <keyrings@vger.kernel.org>; Fri, 30 Jan 2026 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772030; cv=none; b=W7ymqY/y5B3xfBcGrFjJWrSDEZVIP6IdpZEXLm6Jcfv9LeGaLlWMMroFqIAFDHNKCMg7KWhYSsKgQAT1GE1RXu4HraEmnaiWxM1Wo26fxcKiVXmoXBTioan6DrSWtGQMEVpyZDP7AYKC2uSbFtw1ok74w/STMEhrcSMGKL8cGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772030; c=relaxed/simple;
	bh=zdaxgBWHfOjQ1zh3GrG3YLN/+zyFU3lbY6MfKIPUukw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLDkNI0VY7hvG5UyZ+oga2c3q3619Mh5JQ9iOWD30LqB9CbR/sXeHpDAXW/nO37jBkX1O7POGy8Dmxng00AA3pDJwywXQsNOsjE3ZvCRU6y+9wllcgseBhUb4IUHvgeNPJiW07Xn1O2Qexo7wRjEBODIcZMmPZS4cp0xLu+aUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UAbo0KdU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TOlX2r+l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769772027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qi7R1t4hPvfEKk8VW4gjKJE0vso+HGJ4y2WhvsIHDuc=;
	b=UAbo0KdUrU8ViTpysH/WQ9rQBAgH8bQgD0SIEZEsvT+7cgXDemy7tFk4qujrPrQqC3hecF
	J+24Z7WvFAguSjpZETptlE6+H/aksggPiMVH5E9bwnxNpKCRzAcrG6AMsxmysYJBUr4cVo
	r6M3+/LiQq6sWNnfBNXVN8MmfBVpRBA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-tlANtwjDMsaCZ9jvua8TPw-1; Fri, 30 Jan 2026 06:20:26 -0500
X-MC-Unique: tlANtwjDMsaCZ9jvua8TPw-1
X-Mimecast-MFC-AGG-ID: tlANtwjDMsaCZ9jvua8TPw_1769772026
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a773db3803so23832285ad.1
        for <keyrings@vger.kernel.org>; Fri, 30 Jan 2026 03:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769772026; x=1770376826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi7R1t4hPvfEKk8VW4gjKJE0vso+HGJ4y2WhvsIHDuc=;
        b=TOlX2r+l305YUCPNU5nTuFbsbGNAzRCRbdczHGrnIRQzV9y8iMAg8KONhHzFWcE8Zq
         98R2GNKoCLJh6GGlaGC+Az62ptbFqkNhmEZWyKvuuWxl8ko/MJglOVlvtC/uymMR7mB6
         WCSdRZL1iKyEPZPDD05dtKbIFNpDXTx14x3BT1PSKQ5cki9xMropIDIU5ntq1ZamJvxe
         Bk26peZnfPiUeWQq5mm3nKIGByadfO0YVbXp9EOGfu/tpVKsgODKXbVsovoEjXNgWy1t
         pdXBD6PBDUoVnrp0rQb3BBnUrLajJvufZaCqGFZTevEee8UBEscoYllpyflT710lv/fe
         T9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772026; x=1770376826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi7R1t4hPvfEKk8VW4gjKJE0vso+HGJ4y2WhvsIHDuc=;
        b=wn3pnYITcu7XuJun9TnZjgb6ajMKhI2+M9hQS6ZGQ/h8H3lOkE5pp8qSmKgRDV9no6
         I4J9+xx+YbBHoF2uEqykzu5gFXFfV7vG85KbgeFk3qtsqrV64+YXcWGt7uytZpTg/jfO
         /BfSRPXm41643il3eHXulhanrg7u+ig9cBnC/tsjnsDomVaMIJ0PDbR9+vrUg6WBkaGb
         wO4FM3/Z5zvVPjD+HQoyX7+QFHWpcnAEP1EaoqVwNOcRjJ9NHsc1/55diAw+5kFN7+wz
         rsiCZIrJTZwXfBxFtMSWqX5W2rQHQZfe4qWO31JxEdK7/kVesI97mpsS5BdAjfjaOg+z
         Nesw==
X-Forwarded-Encrypted: i=1; AJvYcCUIhAUE3RFJPPRgkrYabtG5voKHwzmTUZYg4aIlNKpNP8gFBXLZv9DskUvt2jnkaIWK8jHRl87QhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1rd/p371QS0LIxqNck10dA6IhAMLsAp0Dxaq2gXRrtDs8xfQ
	sKKGFes94xz8xWGheXju9ZnBv/vZS2NR64q9tc6rOxjfIYRmAHY/rQOiTRlqG3x4qw7+6wxhbgP
	VHS4lJZiyjB5fP6NGMWuc1I9p1foyxBSgWARR4rX3+Ye9r3J2nF2uaYbn6722
X-Gm-Gg: AZuq6aL6kfEIF7vWb65vXVJc2KnID8EtyuQMikW2TSH9Ph5PRi7NvWJQaElmL4yZiYO
	0cdbwgcFg1yAxRSDpigpN/XCCpfYL2Oi9jP9/uDFm8Q11PbUA+RwwaSRs8v/rsAO+jzqzYnH0S2
	WxC67kVmX+8l2XwHPRe+pVSOIQ8/pYP4apna4o3Oniqk3LzDWtlodN6LkWnF5xhQtg4Xi3KpcUw
	by4Oy9Ebe6zoDuu9dGCXcl7XugXzQYfMSfAcTShyFoWL88OnGHqVHM2lym5TApxrrcih6ZBM0K/
	DXNDRBvB/XGdAkJv8F2tsdClrYtBpsxX3Q+LDRwG7KLuHGKetZNDXgepJVLIYwSexbWohko+zpF
	1
X-Received: by 2002:a17:903:b0b:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a8d992f0c2mr25748605ad.31.1769772025505;
        Fri, 30 Jan 2026 03:20:25 -0800 (PST)
X-Received: by 2002:a17:903:b0b:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a8d992f0c2mr25748205ad.31.1769772024877;
        Fri, 30 Jan 2026 03:20:24 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm72565075ad.3.2026.01.30.03.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:20:24 -0800 (PST)
Date: Fri, 30 Jan 2026 19:17:16 +0800
From: Coiby Xu <coxu@redhat.com>
To: David Howells <dhowells@redhat.com>
Cc: Mimi Zohar <zohar@linux.ibm.com>, Simo Sorce <simo@redhat.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Eric Biggers <ebiggers@kernel.org>, 
	linux-integrity@vger.kernel.org, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: IMA and PQC
Message-ID: <aXrKaTem9nnWNuGV@Rk>
References: <1783975.1769190197@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1783975.1769190197@warthog.procyon.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3976-lists,keyrings=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,redhat.com,huawei.com,gmail.com,oracle.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ietf.org:url]
X-Rspamd-Queue-Id: 77368BA0A7
X-Rspamd-Action: no action

Hi David, 

Thanks for starting the discussion on potential issues or challenges for
IMA PQC support!

On Fri, Jan 23, 2026 at 05:43:17PM +0000, David Howells wrote:
>Hi Mimi,
>
>I've posted patches which I hope will accepted to implement ML-DSA module
>signing:
>
>	https://lore.kernel.org/linux-crypto/1753972.1769166821@warthog.procyon.org.uk/T/#t
>
>but for the moment, it will give an error to pkcs7_get_digest() if there's no
>digest available (which there won't be with ML-DSA).  This means that there
>isn't a hash for IMA to get at for TPM measurement.
>
>Now, I probably have to make a SHA256 hash anyway for UEFI blacklisting
>purposes, so that could be used.  Alternatively, we can require the use of
>authenticatedAttributes/signedAttrs and give you the hash of that - but then
>you're a bit at the mercy of whatever hashes were used.

IMA also uses pkcs7_get_digest mainly for the purpose of checking if the
digest has been blacklisted:) So you making a SHA256 hash for UEFI
blacklisting will automatically resolve this issue.

>
>Further, we need to think how we're going to do PQC support in IMA -
>particularly as the signatures are so much bigger and verification slower.

According to my experiments done so far, for verification speed,
ML-DSA-65 is consistently faster than ECDSA P-384 which is used by
current CentOS/RHEL to sign files in a package. 

The size of a single ML-DSA-65 signature indeed increases dramatically
compared with ECDSA P-384 (3309 bytes vs ~100 bytes). But I'm not sure
it can be a big problem when considering the storage capacity. Take
latest fresh CentOS Stream 10 x86_64 KVM guest as example, without any
file system optimization, extra ~189MB disk space is needed if all files
in /usr signed using by ML-DSA-65 where the disk size is 50G. But I
don't have enough experience to tell how users will perceive it and I'll
try to collect more feedback.

For the details of my experiments, you can check
https://gist.github.com/coiby/41cf3a4d59cd64fb19d35b9ac42e4cd7
And here's the tldr; version,
- Verification Speed: ML-DSA-65 is consistently ~10-12% faster
   at verification than ECDSA P-384 when verifying all files in /usr;
   ML-DSA-65 is 2.5x or 3x faster by "openssl speed"

- Signing Speed: ML-DSA-65 appears ~25-30% slower when signing
   all files in /usr; ML-DSA-65 is 4x or 4.8x slower by "openssl speed"

- Storage overhead: For ML-DSA-65, /usr will increase by 189MB and
   430MB when there are 27346 and 58341 files respectively. But total
   size of pure IMA signatures are estimated (files x (3309+20) bytes) to
   be ~87MB and ~185MB respectively.

>Would ML-DSA-44 be acceptable?  Should we grab some internal state out of
>ML-DSA to use in lieu of a hash?

According to 
https://www.ietf.org/archive/id/draft-salter-lamps-cms-ml-dsa-00.html
ML-DSA-44 is intended to meet NIST's level 2 security category. Will
NIST level 2 meet users' security requirements?

>
>David
>
>

-- 
Best regards,
Coiby


