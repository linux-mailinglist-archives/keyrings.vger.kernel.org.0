Return-Path: <keyrings+bounces-530-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A084D861
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 04:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C0F2818C7
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 03:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0487625634;
	Thu,  8 Feb 2024 03:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VoI+KP46"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB697200CD
	for <keyrings@vger.kernel.org>; Thu,  8 Feb 2024 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362320; cv=none; b=sbCYDuYMEi1kfVnQzHLrGyPmRuJC0qBQFbqkSzfvwdU6sZGePf1G4+Tn1kvPCcEaJxSrpgxg3/zCMFgR0RnnuidNu2Nodps11iSlwNYuG+ibl4uwmKWZP1aS5B7b+TkjpKlwKx28G8jOBuWsw1nRTWvNF2f+oWdMSO8lUI973dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362320; c=relaxed/simple;
	bh=t5byIeFBT0qwzSHCE93UPeYMt9b3B4zzyhQWcZO/s9M=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=gIgyDvM8hm2nQHRhxPSSI48Q8lG+o6NOQne0/0Pw/1lWgOdMF+n71kdpV0SwxrYPrzRpDUFLVZmE1bv7+ECAklLGONIXzWzSzVMWHkPkQjIfVGaopK03Z2PHOXcPCLlykTjQWEFfdFkHBBB3Mglk9cqNOB/6aN7moxngSt79G7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VoI+KP46; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7857964f57aso53442085a.1
        for <keyrings@vger.kernel.org>; Wed, 07 Feb 2024 19:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362316; x=1707967116; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nO7UrhjaK7P/nNKI6L71283PDb2e05jXUgYDmT8EbmU=;
        b=VoI+KP46kOWR459cuqrVwOQK5gJDVQcNsa0MNueTVdm4oRz2zoLxGrIMaz7MEpTaEM
         LHXhH8nevo1IKNC64pftBtB8u+L8Qq+6oy0aRdF5VpyBTxng0xLq9aYLG7G6/50DGFTm
         luKPVcuh3cpYwO42NLI+ONFuqc09ZeRQ1YLLGUeef/Wh4Ll20MkTOlndR4avYXCxf2a+
         bco+f+dZVXODadrzr/1e3wt7LdGyytlEfzSqnoqTyb+20SrVWx4APfk0TG+rfqiaUWha
         g9WcMWSGmTZUnh3asw7d5HqAFCmvszzdRF/4l9WTL7aGb7DsIyPeeEl5yQ3rmzxJtoOo
         E1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362316; x=1707967116;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nO7UrhjaK7P/nNKI6L71283PDb2e05jXUgYDmT8EbmU=;
        b=n+nRnsv4tOqiNZFUEoZt/ywJB/zxZda0SPr5SLtDZ1KW76irNuiWB5tu9Cf16vfemS
         aiuVPVvhEOaucYIqlCMQZsjr60MQ8n7l0944jq2Oc6ZgNyyqtwOdDh7EmhuJW/RpJswF
         vtk2s/ULqR+Alze+pRbOTZJzZLqWvyMrhGCp2NmtUAw5clwIR8gBdR7sLDD8UaLJ4ET5
         kDTyL84rSXLUOix2/H6lWocOCAIPc1hgPnpgGk5HiFWyz0ZkUcrZPGQ2iNMjHDrKwY6A
         3LNdulBpj+xHC51CGXrbRQ748Z1JZ7S6Nomo/9qnOgkFkStTbZeSa293KLmGAvrz4TkC
         F6Jg==
X-Gm-Message-State: AOJu0YyPw1w3LssVPYYzZ6VMvVb4bg79TMX0y9i/soe+uNm5W9QEtFpD
	d1y6KrrGbHvk7h3u0njOrXzH4Bf9aAAt9Uclwgb0HZf1VnbnABIj2UN+xxzZ2Q==
X-Google-Smtp-Source: AGHT+IGQgTV0pAnpruoMhNtULpiJZkKPhu3QbpUpHotuhZrfJKRtGmi2+s+JP8T1e3Vr1mLtb/qIjg==
X-Received: by 2002:a05:620a:29c7:b0:785:a786:94be with SMTP id s7-20020a05620a29c700b00785a78694bemr527690qkp.31.1707362316365;
        Wed, 07 Feb 2024 19:18:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUqiSJqUbw/1zwiZ559Fwo9aoc1UXvOinRKuYHx3xAKZyoqDvhR8y7989+/X8pIVNcZjCt+UMln5Bpq20HBpsB4IH5JYo/wx5+Yb7iTA3WCwCy8SaemT1lb7M1T59sqTonRRvKE16srh0XwE4m6xtjylp+qCZ2w8BSUr3HJoyDaMj4LJTJTWWxTKV9rBMQysjgbf2bzpEyCQxjD+/wSvFmRjr0BlDLuoSr+wdWVifE/1bVDSM6vgwNfEHsYvYjeoembbxg22FdKJ3c7Soy/psxh/tl+JJj/QrJVT9oJQt/k4cdWF/fDGAXHtsSCOr0g9y+5mmBVpk5i5bmiO8bqrS+XlbBj8L6kX8rS/X3cTCsn+dKo8Q+Y7nCsFSQG7DWH9akfngvOvw+2uP3OvezR/aqz7RQ8rYBCWDutL4TtsVmgRQcWil7NG3G7+o3cA2yJvyfu0XzD9BjHS2z/yC8q8dyM93GUz5J2uvlA8WX7jEoBfm4Zg5MtRJ5/gq/fUKOo9mby2/KMKPsegmU+SzCsEbGcrq+qpS9kcntV/XN6gUxRpHFf3XbNRXifIwzzXIYE7v7B7hm+ROPmH/wbf970xkTxdKZdm2ueuWoSPDI2FXt/6fYsAVvTBUpiF5oRZ1QNCXG7cuEfUGeYhsy+bl6i9pPa9ql893keKoCgkp7uJjoS+fUErmoBPswaNAwO+0BBNHh94jfDFLFMFJYWXeYYdUQv+KXEmwDpTVBw1aKOduAHFQm72ivo0eRwNhrNxO7/Pkim0ItGBbiDC0YcQ5/lTqJibfYFuiR6HxuOWMb/LJOGDyyGwVGo70bAiEQ+hFPND7/D5PNw3Z6unxt19UMWVZk7nlKHhQJ5ab6Gsd9A1WYWeNzytrRi7e6x/Y5Zc6fPh7okHVmNHnRWMp+zLuVemT3KCNAMtm2eaUk6gCRbMpI7QmyF6k5EL/3x+U7rP+/2PcUWI
 RMgmwoiADLC5c=
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id m21-20020a05620a24d500b007840a08a097sm1065081qkn.76.2024.02.07.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:36 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:35 -0500
Message-ID: <573a5abb794790bc6b76327f09ffb391@paul-moore.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, viro@zeniv.linux.org.uk, brauner@kernel.org, chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de, kolga@netapp.com, Dai.Ngo@oracle.com, tom@talpey.com, jmorris@namei.org, serge@hallyn.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, dhowells@redhat.com, jarkko@kernel.org, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, shuah@kernel.org, mic@digikod.net
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v9 4/25] ima: Align ima_inode_removexattr() definition with  LSM infrastructure
References: <20240115181809.885385-5-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-5-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> Change ima_inode_removexattr() definition, so that it can be registered as
> implementation of the inode_removexattr hook.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  include/linux/ima.h                   | 7 +++++--
>  security/integrity/ima/ima_appraise.c | 3 ++-
>  security/security.c                   | 2 +-
>  3 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

