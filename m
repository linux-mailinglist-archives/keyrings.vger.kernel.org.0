Return-Path: <keyrings+bounces-19-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BB7E2CD9
	for <lists+keyrings@lfdr.de>; Mon,  6 Nov 2023 20:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 753AAB2093F
	for <lists+keyrings@lfdr.de>; Mon,  6 Nov 2023 19:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E531D20301;
	Mon,  6 Nov 2023 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASFf3jj0"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A350E168BC
	for <keyrings@vger.kernel.org>; Mon,  6 Nov 2023 19:31:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC66C6
	for <keyrings@vger.kernel.org>; Mon,  6 Nov 2023 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699299094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
	b=ASFf3jj0lazzOKnHJ/q3yO4maXPHk8gbLkUqNytOQ6xTG2dufg00/+F0u9inNM9APzRo/5
	SElMhLm5CFMQsfDPQ8k7INcQ8V+fEBBVSyEcVdFRFaXQdt7M+t2/w33HPKIpE2/m62lKFR
	hRlcmYvT0Z+oYrRTbVMwgylrr2Sr7TU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-AKch9maZPgakYTyFXHg4Og-1; Mon, 06 Nov 2023 14:31:33 -0500
X-MC-Unique: AKch9maZPgakYTyFXHg4Og-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77a033cbd96so491577185a.2
        for <keyrings@vger.kernel.org>; Mon, 06 Nov 2023 11:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699299093; x=1699903893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=PewP52g+mzDSMV/FO3iZC8T40cQQctH1vqfRGpEucmyMqA+loQHWDIzEzJfCpRNOiv
         5TEvtfX55Na3NbvVtDVikDCw4TQIzsa34s0p9Ky/InddHkFkbhdjYP3a/IKvs5A9PFA4
         O+kYWCdkrZuIpUxklVVRaowOd/Qf/2MjWshuK2MmZwLCatfSt0mbGDotmFlyS8LCKQeq
         L1Q+Hea3yCM+6KihJ+/bLNQD6zoIyDzypnAb1xja68S4Uj88eu51/EXbgXul7nCC42eH
         d6EfBXclWmDZLW/KDAJqv/hYNgljnzawX54PtlEs2uyiROrGNsg2RZ9HvTw7ugEni6VO
         f2DQ==
X-Gm-Message-State: AOJu0Yw2sQSlj/KnIhSxn5faezKqF7/56jxTDaam/KC0erwXvR8C2rtV
	p6hAyvPeLGPOqOPvaJ5MjEp7FBk51hmWyoSTmEJ083gSYMLdeFnm0mlNkQBnsQu1Gz+x2pYp9mG
	71biIdOX3ExzG2H2DQl0=
X-Received: by 2002:a05:620a:31a6:b0:773:c4c8:2d58 with SMTP id bi38-20020a05620a31a600b00773c4c82d58mr33054184qkb.59.1699299092995;
        Mon, 06 Nov 2023 11:31:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMC4OZw13o7zojxKDTLQnTVqildfL87qAiPF2IC97OBWWvfcH0eCZKZ8LoCuggfuWN7AoEdg==
X-Received: by 2002:a05:620a:31a6:b0:773:c4c8:2d58 with SMTP id bi38-20020a05620a31a600b00773c4c82d58mr33054171qkb.59.1699299092693;
        Mon, 06 Nov 2023 11:31:32 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id oo12-20020a05620a530c00b007758b25ac3bsm3555862qkn.82.2023.11.06.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 11:31:32 -0800 (PST)
Date: Mon, 6 Nov 2023 12:31:30 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, William Roberts <bill.c.roberts@gmail.com>, 
	Stefan Berger <stefanb@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>, 
	Peter Huewe <peterhuewe@gmx.de>, James Bottomley <jejb@linux.ibm.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Julien Gomes <julien@arista.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] tpm: Detach tpm_buf_reset() from tpm_buf_init()
Message-ID: <xp2tdlw2qjg3pbazb3oye7poeh4r5neeqbsvamgiazdl2bouwa@qnxhvt7vzkpb>
References: <20231024011531.442587-1-jarkko@kernel.org>
 <20231024011531.442587-4-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024011531.442587-4-jarkko@kernel.org>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


