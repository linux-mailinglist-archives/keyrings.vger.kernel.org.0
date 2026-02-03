Return-Path: <keyrings+bounces-4019-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFPwCaz5gWk7NQMAu9opvQ
	(envelope-from <keyrings+bounces-4019-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 14:35:40 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76ED9EE5
	for <lists+keyrings@lfdr.de>; Tue, 03 Feb 2026 14:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B35C03007A73
	for <lists+keyrings@lfdr.de>; Tue,  3 Feb 2026 13:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6431839E191;
	Tue,  3 Feb 2026 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fz5BJZa0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lpWbaqrA"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864F439E195
	for <keyrings@vger.kernel.org>; Tue,  3 Feb 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125733; cv=none; b=RiMJ1HOFAytdOUTlmAuzjvHVQVdIrp70EHrbZxB/eqGWqQSepQt9MUP3b7m9OHdcJ3VeXOazq7T9VaFAM+BRru1djiu8CD9cnBEb0JIoteKxr8lDqiMKschwCL4UlRsez7E9cWsWjeBf/SMaoFnB9S+lgILG+DKrfiiOJRoo+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125733; c=relaxed/simple;
	bh=io/EYxv7ttfZ5c/LLL9VvcayFvS43ID701JLwnZ6lKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABA9Q85I8+6EK1z75hNGG9SQ8yHDYvFpVLlWekD1QJjGa2BVsDHu3q/sPDcxfn7EzYYn9IkwqEbxQHI5pP2ntq5jlQrv0+FF8BVtjJepk88Xvgvki1VAoWhJ8NiK5KPz2/572nm3ioX0zoXTz6BbUCnAe2ol9n96+8StJZdvkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fz5BJZa0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lpWbaqrA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770125729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BpfLzNQISMcvb3bYUowH+LAX7zmYdRcPREXRs4s810=;
	b=Fz5BJZa02fKd2R/ktjSlFmcWRsZLsBkIJAmPlB9h5UftgkgMXcaN1SX1gCbINntsbcSnYt
	dBKcB5n1QUPogBIKAXYW6OP0bm24cKQdVxyPxEuJ2OJMMD82pOgbk5DEOhsXGUZpCc2s+Z
	rQ+ZWR18YseUttMcGQ2B1r1KccwPa1E=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-tu5NOzHWMiie3uWWmemL_A-1; Tue, 03 Feb 2026 08:35:28 -0500
X-MC-Unique: tu5NOzHWMiie3uWWmemL_A-1
X-Mimecast-MFC-AGG-ID: tu5NOzHWMiie3uWWmemL_A_1770125727
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a77040ede0so55908205ad.2
        for <keyrings@vger.kernel.org>; Tue, 03 Feb 2026 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770125727; x=1770730527; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BpfLzNQISMcvb3bYUowH+LAX7zmYdRcPREXRs4s810=;
        b=lpWbaqrAqaJRaYbc1ybv2Ucqx11nF82dGvFMj7aQe26XVyKS63ImwXTt4yQV1OJOFd
         zbbXFnkA5Vqj0qWehdKuJmpfE4USQVqU8ZV04xjSn7cFiZCpXyCQ0zYz2OfruEB8qJzY
         g87DlfrReDJG30Ebwdxxuk4Xi86yk3nd8BbfvSyXwqtrYfnzO0Q8caI2UhhBMck45Kns
         2B/Q4bHmS6YjEq+wM/veOSeEGnAMgQjGtRkl92YVR1cJ4N3REhoWxfifgpA5YK8uA8Ae
         hxgeLtRgOd413PM6jOKRx16nuhuAYPkYkJ7ct3sQ/+FpECiROxL4UkLUiuMrk6WijCjN
         z/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125727; x=1770730527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4BpfLzNQISMcvb3bYUowH+LAX7zmYdRcPREXRs4s810=;
        b=f+prsPBj74TgJaKCKf+NyZOn9ILJ/Vzj/ocBENGv14UqNRwZmJccKHrm0dibPel+PA
         y4NwXi2zYDjT6Xn6382GnUC/Wqzo0SPk+AXiekAwELAAt9vUhkRmKIi8n64anrmlcnrh
         kwgLd+QWxRxbfRhOHRcouZjrk5DULhiMR0T1xXovbQcmY6/3gM2l7bmJ5sWT34ghjE6v
         wqFLRoxaDqLk5//B8pY5oR+m5BJ6NzVfPJq0yu+2UskQc48Deqf5EFHqJEKN5i7bn0OA
         BjaYDjsQu8aX96gPn6bG9A7Wm9oSjMG/Klw7JTvKDw1rwo5+fk8ietWebBvaoDNLrEqu
         MwjA==
X-Forwarded-Encrypted: i=1; AJvYcCWeQ7MDaQhOWuMjyjcUVKuCySIDHL5ObsqrIA6CtnAI0UD7ka4NJSuT+WAyJgguwyOlCB/f4vh3tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+UNg3Sa/2ChygRpp4hpk+2k1DyV+xcyvOac974u6834L8dPR
	1Bt9wGe1u/NkWh3qGJ88bARyYTqWPpXtJwXNJI/Sj79/ZpynDuyzX1SYWNzyDxv9gR8z9stQ4bV
	6h8Sn0zCCzGWwQP7uVMZh+QINasfBC88BpjVEkw7LU8RbPjih6SS044hinKyq
X-Gm-Gg: AZuq6aLh9ZjJblkS7eY0aW+n95nAa98am5NIdF1lTtk8bONPv2uHNHz8NwfoZc7uaUy
	rQuWCX/nvHpZc0xVFcE0dDheGrT1ciD1zrt8p2DtxfULaf3vxRpQWmXvSfXA5K2k/rzDTH7sNE7
	vKgv/XdqUD9ulkq5fkUUSQZO+psOCcJlggOFrJETBshKUqZJrAZuZOfL7Ji+ixPBLR+KrVfLfrc
	bC5PnC/021CY3xSKvud1goen29Wm+cazwOoYGlYRZDgyhy2dwy0/V/Wo5HuulzVU4n2RtcNWqbH
	SG+k6hnG54Ogf4E5LvO35nxFA9QU7w0B5+L93zh78n557kGYAUorWYugif5GkfZvAsZKSZW23iR
	s
X-Received: by 2002:a17:902:e891:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a8d8945522mr156161785ad.0.1770125727247;
        Tue, 03 Feb 2026 05:35:27 -0800 (PST)
X-Received: by 2002:a17:902:e891:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a8d8945522mr156161175ad.0.1770125726520;
        Tue, 03 Feb 2026 05:35:26 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3df6sm177027765ad.49.2026.02.03.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:35:25 -0800 (PST)
Date: Tue, 3 Feb 2026 21:32:44 +0800
From: Coiby Xu <coxu@redhat.com>
To: Johannes =?utf-8?B?V2llc2LDtmNr?= <johannes.wiesboeck@aisec.fraunhofer.de>
Cc: dhowells@redhat.com, dmitry.kasatkin@gmail.com, ebiggers@kernel.org, 
	eric.snowberg@oracle.com, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	roberto.sassu@huawei.com, simo@redhat.com, zohar@linux.ibm.com, 
	michael.weiss@aisec.fraunhofer.de
Subject: Re: IMA and PQC
Message-ID: <aYHznG6vbptVOjHQ@Rk>
References: <aXrKaTem9nnWNuGV@Rk>
 <20260130203126.662082-1-johannes.wiesboeck@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130203126.662082-1-johannes.wiesboeck@aisec.fraunhofer.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4019-lists,keyrings=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,gmail.com,kernel.org,oracle.com,vger.kernel.org,huawei.com,linux.ibm.com,aisec.fraunhofer.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wsbck.net:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E76ED9EE5
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 09:31:26PM +0100, Johannes Wiesböck wrote:
>Hi all,

Hi Johannes,

>
>we conducted an evaluation regarding PQC use in IMA last year (see [1] for all
>details) where we also considered the interplay of different PQC signatures and
>file systems (ext4, btrfs, XFS, f2fs).

Thanks for sharing this comprehensive study! There are many nuances in
this research paper!

>
>Coiby Xu <coxu@redhat.com> wrote:
>
>>According to my experiments done so far, for verification speed,
>>ML-DSA-65 is consistently faster than ECDSA P-384 which is used by
>>current CentOS/RHEL to sign files in a package.
>
>Regarding performance, similar to Coiby, we found that all variants of ML-DSA
>consistently outperformed ECDSA P-256.

Glad to know ML-DSA is also faster than ECDSA P-256!

>
>>The size of a single ML-DSA-65 signature indeed increases dramatically
>>compared with ECDSA P-384 (3309 bytes vs ~100 bytes). But I'm not sure
>>it can be a big problem when considering the storage capacity. Take
>>latest fresh CentOS Stream 10 x86_64 KVM guest as example, without any
>>file system optimization, extra ~189MB disk space is needed if all files
>>in /usr signed using by ML-DSA-65 where the disk size is 50G. But I
>>don't have enough experience to tell how users will perceive it and I'll
>>try to collect more feedback.
>>
>>For the details of my experiments, you can check
>>https://gist.github.com/coiby/41cf3a4d59cd64fb19d35b9ac42e4cd7
>>And here's the tldr; version,
>>- Verification Speed: ML-DSA-65 is consistently ~10-12% faster
>>   at verification than ECDSA P-384 when verifying all files in /usr;
>>   ML-DSA-65 is 2.5x or 3x faster by "openssl speed"
>>
>>- Signing Speed: ML-DSA-65 appears ~25-30% slower when signing
>>   all files in /usr; ML-DSA-65 is 4x or 4.8x slower by "openssl speed"
>>
>>- Storage overhead: For ML-DSA-65, /usr will increase by 189MB and
>>   430MB when there are 27346 and 58341 files respectively. But total
>>   size of pure IMA signatures are estimated (files x (3309+20) bytes) to
>>   be ~87MB and ~185MB respectively.
>
>Two relevant aspects we discovered regard the signature size. TL;DR:
>
>1. Most file systems need to be tuned to support the larger extended attributes
>(signatures) if their size goes above a certain threshold (e.g. enable EA_INODE
>in ext4). This influences not only disk usage but overall compatibility between
>file systems and PQC signatures. A file system that would not provide the
>functionality to store larger extended attributes would be incompatible with
>large signatures.
>
>2. For most smaller signatures (like ML-DSA-44/65), we believe that the overhead
>of signatures is actually compensated by fragmentation within the file systems.
>For example, ext4 will allocate a full file system block for extended attributes.
>As long as the signature size is below this block size, we did not observe less
>free space on the file system despite the larger signatures.

I think this explains why I didn't see any disk overhead when using ECDSA P-384:)

>
>Overall, we concluded that ML-DSA-65 provides the best combination of disk
>overhead, performance and security level. Performace was good and for all
>algorithms with larger signatures than ML-DSA-65, file systems would need to be
>tuned.

Thanks for summarizing your findings regarding the signature size and
also sharing your evaluation!

>
>>According to
>>https://www.ietf.org/archive/id/draft-salter-lamps-cms-ml-dsa-00.html
>>ML-DSA-44 is intended to meet NIST's level 2 security category. Will
>>NIST level 2 meet users' security requirements?
>
>Regarding security levels:
>For security levels, we referred to NIST IR 8547 ipd [2].
>ECDSA P-256 has a classical security strength of 128bits (P-384: 192bits).
>According to [2] Table 3, these levels are met by the different ML-DSA variants.
>So, if you are migrating from ECDSA P-384, you need to use at least ML-DSA-65 to
>meet the same security strength.

This is helpful info! And thanks for sharing the perspective of
migration!

>
>Best regards,
>Johannes
>
>[1] https://www.wsbck.net/publications/pqc-ima.pdf
>[2] https://nvlpubs.nist.gov/nistpubs/ir/2024/NIST.IR.8547.ipd.pdf
>

-- 
Best regards,
Coiby


