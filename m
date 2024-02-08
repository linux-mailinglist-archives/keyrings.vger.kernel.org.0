Return-Path: <keyrings+bounces-543-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241784D8C7
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 04:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2432C28271A
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 03:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5F13839B;
	Thu,  8 Feb 2024 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="gRN7/ZjC"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B932E85B
	for <keyrings@vger.kernel.org>; Thu,  8 Feb 2024 03:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362335; cv=none; b=T56AV0AJ2QwZ5AGCF2LiaK9mBcYj6OVe6MRX45lDmT3+9W3RZNZeTVBB3dByN+6Y6+ef8xrVaxfFff+RSHW0clHsDz58jP/MRC9/ffxzIHWejI7qerTuA7maWalFgr3F51GB2kbWdsd2CbBMExlR3i3CRtjEIooQU2k3aYCVaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362335; c=relaxed/simple;
	bh=DiwlVKq/rRLjPWH/bc00wUtKBB7mMXp+ciN6o9DkWP8=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=IXjgvD0O67S0b13nv760txZkFRRBhVbK4oAmJtRaWPt0x33x13wz7l7EMXl2kM6Dw1HO2fV+fr80BbOAkVOeqndeJ7ZozaIqaU7ykkEgH3iKhu8Y92ZyMSWpNJyBvnBByzctRcanCeiImeHMLYqJxAIhpr+N8ruuxKwmAm71pes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=gRN7/ZjC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-783d4b3a026so73612185a.1
        for <keyrings@vger.kernel.org>; Wed, 07 Feb 2024 19:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362329; x=1707967129; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w8uIF53Z2DXmiuq41g+nsrX3AvPRF8jg5UUgvEoPViA=;
        b=gRN7/ZjCN1IvnwEnxdoxsOThk5bMY0fzylZ6zONpLn/qATAkAkbUyZ80kWcjWQmnNs
         0dLAvsipHS6uScN8IKo4Rp0PjQeu5/1wOOGGtR+fiU1KyGv5KXkgPTLhn3IUW/OFmuJ4
         yqHzAnZQp1Ja7HKB6cjvpgd6MqthzfJlkw7OMvRrizPcLhIG6Qn+yNPlSWPFapaHHIjN
         xJcK+jeDcJLGLe0SUDmlD5XIF9SbSubhCCfhc9YrMy2p1OVaFvTybPQtOPUMHBTa0/8X
         tt9eA/xpwgDHc0HISsQJwxvQqj9nNFZdQfyQPzothgLBHzCAw+23gZQDBy99wQ8H2WlW
         CphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362329; x=1707967129;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8uIF53Z2DXmiuq41g+nsrX3AvPRF8jg5UUgvEoPViA=;
        b=ELl8NLz9sC3K7vpBLidcs/Cvah0NhC96paSp0VgWuQzMboSaXIIwRX81wvbNWaZKuS
         Is0eHQNldUKHwI+MP3rcKqIgzctK8rMOakFd7QoTWR0c5bJs1twmWlqX+qKOA1+i7WkU
         iwXiOZ+1AC3wWu2dt9R8mhjo2B9pyDWYXu70guWvWoUvbJbolkYys8X2dYe3M6D35Wcq
         Mf7bSZtt7HmBzio04HacqF0rhQjtpfnqRn9HDLiWlucLrPjjTCslZKksrx4RiZ8Un7oQ
         59Qx6ShC/gOOCSkaK7UpV7lxbFgG8pZUTC4/+K3cOL2asoVJm65AZfIr3bQcFCPHeut3
         rFMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGj2aEzHb7cOZ+S8U4cxRVtXymwXWI638maNG7PVcodqNINNlRrLGx99iik2C1c/O7U8elMr0akgfwjhsCpiPFP0O6GEM+vlw=
X-Gm-Message-State: AOJu0YwVn791jrZ1t4ePb2558KPJxPsCEmIFSGggjWhJvbesCzb/ycm/
	D6Xhl3hIYMlA2A210AjKex/az7trBuzssH2ffJQ2KNBr2tQnuA6wbzshvYs5gA==
X-Google-Smtp-Source: AGHT+IGouxVsdwxvxxJ96/FPEYbCGLXmMxM09SVFDDRIXGnHSmuGQLn7Z94ZYhb0/P1VLm8XriRe8g==
X-Received: by 2002:a05:620a:5d:b0:785:8bb1:5d6d with SMTP id t29-20020a05620a005d00b007858bb15d6dmr7695936qkt.32.1707362329414;
        Wed, 07 Feb 2024 19:18:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViKYI8R9WvIOxPbkG2M4Av2YXb0xQA7czB3RiiA4Zzl0QwFFVI56/1xAkCejRCH2QojDt85FsuaL6a6Kb3gZqyuXItl+GGFhfTbtrfsUAhi84hRDUXU/lJMeAoNs3+UcMCV+sKoH74nLJCp+we9mEV9XExWQWsv7JUjTLJRs+MsUrUWrol6axwrKh7asMc4OaSWWr49VWjS4Nrw9tJFCVmeYgZQEJvRy6DCI039tgwg/23ti0cQ43eSIkDbUDu1wZJMeDuNF9p9wEW8F5mil6vM5fOQDBit0UAa5G3WOQenTf5LelmaVd4RD0YYjOYAYoXoLmdJZGUUlrNzWpIw8iVPidW2KkNQU61FneQH6Gv8HPsxvsIFPOyvF86D/k4yUqc9cYrixD+QrJbyjnFPYXwQ1YiJBzqG0quifcUGI25OSqW4cs2XdX5G2wxfAXBtKt4GX3RSvRUbDV+o2BdwrZvm/GUKqLktRs4LBuSPr3GsOkAnIIN064yu/OB4XZwl3WQVqLY38Mo6G8iAt6CcmyGOg+BxBIlILyY/XXjiZz6Mz0sKUgH7cMdU4BN6Sq5zxxkPnq4m3T2Fp6BeIUFIbqK45ht8qNiG4IDfaHI+CY+asy+OLQQEsLVZMrYna9MGzCDDaVu03UHsUgT+jBjCFBuUUgG73Evm9gqAoAMbBUyxN5pAPFi7rkgYlZVkNawpbw10N9sE1XrxLScQuV6GzkeCZ+qBR2FRgadT4E03+to6aVg1JIn4l9/smIr55wYbqYz+r6yFke7CIYYqq8bqBV9ndAvBP78sR5rj/zby4dUph6GCOMkwEYKpxixJL8BAL9xj7inzhrBwXyo6rjWFGu8kOnrTFATEud2Wcp8/WOJZVviJbqSD75JwzW47ZrfXCg+0EbLdoDtUZc+jlnoF2uPo5Xq3JqVMqzXWs2Oknt7AOJthrQCjGENUUpCY7h/isyaT2
 blihkViOIOu+Q=
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id l4-20020a05620a210400b007855b0befb4sm1068621qkl.92.2024.02.07.19.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:49 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:48 -0500
Message-ID: <a00ac4a8ea267e7f03912197728c3081@paul-moore.com>
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
Subject: Re: [PATCH v9 17/25] security: Introduce inode_post_remove_acl hook
References: <20240115181809.885385-18-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-18-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> In preparation for moving IMA and EVM to the LSM infrastructure, introduce
> the inode_post_remove_acl hook.
> 
> At inode_remove_acl hook, EVM verifies the file's existing HMAC value. At
> inode_post_remove_acl, EVM re-calculates the file's HMAC with the passed
> POSIX ACL removed and other file metadata.
> 
> Other LSMs could similarly take some action after successful POSIX ACL
> removal.
> 
> The new hook cannot return an error and cannot cause the operation to be
> reverted.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Acked-by: Casey Schaufler <casey@schaufler-ca.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> ---
>  fs/posix_acl.c                |  1 +
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      |  8 ++++++++
>  security/security.c           | 17 +++++++++++++++++
>  4 files changed, 28 insertions(+)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

