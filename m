Return-Path: <keyrings+bounces-548-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A554584D8E1
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 04:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA8D287823
	for <lists+keyrings@lfdr.de>; Thu,  8 Feb 2024 03:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3237A3C494;
	Thu,  8 Feb 2024 03:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BbjyjKNh"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5971E885
	for <keyrings@vger.kernel.org>; Thu,  8 Feb 2024 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362340; cv=none; b=SNLcWF+pZSAlQt8pI2y3h/QO5/4gvKR8Xm9IAwlsROr8KgAP+tL5Z8bmaNXouK4hEtbOEZi9M7DgkgKIkn32+WzF6WzuuriaBIXnGNUm2UeIdtAq3RuyeTeQ9ncFabqbKER1D3fII0NJsKF9NkI7A6YGMnP1+uRJX6oJkgC4qcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362340; c=relaxed/simple;
	bh=+w3nNF6uogpeOgLKn6Je5uKi9bCs3moV2vFFqe7Bbh8=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=Ea1A2mqESZJ1IrkOxTtZGJ29JT3sTljAWCq8pWE6FoEurlUJShxb4MCpcFZC9fYk0uGbqvZq62ZXxJuy5EmC9fqGkoeI86dWlmNXPTLyXylqN/QfRRrkiAfjIhsIkbPFuqg+cHsw+/HWxL/i/YUK2qxSHxQ96W7/6cRV7PAMXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BbjyjKNh; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6818aa07d81so8960856d6.0
        for <keyrings@vger.kernel.org>; Wed, 07 Feb 2024 19:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707362336; x=1707967136; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q3KhjY53aOKiu/8dSgqk45G/A+W+yYQLdqnafjFGGWk=;
        b=BbjyjKNhCJDIHDULzdrz3cMP5t5gjTQfPqZ4qw2zZH9jzGH7XOQSUOR+4ShxssiHKv
         me+rCLneCG5198J8hWoEX4VQPqUVhx8c595aKcRDLEDjPTmKVP02S96nqfzmAq65Y9Ou
         NWk0pqmz5ccLuh7xWJ3XC+r935s8TGLlGFFu/UCdUNLs6MUBq9aBu/UVPRfNif9MFYO+
         Ud5SI1+Ddn49eoyujsW0dy87ayIMqCq+oR5WNwKJGWMF5j2au6g6oej3bhNaqkilum/I
         WuljElJXHqkwYt/3/JkzU+uFq8N1YguZfoVbvvwlmAs98YaPyryAsFuSPg08Lt7QhSoe
         vGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707362336; x=1707967136;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3KhjY53aOKiu/8dSgqk45G/A+W+yYQLdqnafjFGGWk=;
        b=Uw6d1Ul6bR6fc8aVw2uRJnTIZrGPmr//E3wXpf8bch7NYz1A3SnaLIQyuFay9v5uu+
         8Sv2q7eW2JwlAUfeeLSBrQmJrhcR8Qk6azf0H94uRyq3w13mGa8NPnK8pJREXkUzQM7S
         8tohD/jYbZD/I1e/GlJT1haagMHtfcx2ncSJivo82TVKwrSPhNQLKCR014AmTbaKM4Ok
         Pq1I/Rt7zQpN6bDJSlg3PfyOkxlaZ/AKEU+QQmdoJjdTblxrYDQkbq1VMNvBxV4Ax1PN
         QYVcZHQNLjXIq+VsR/zjPvAsqQxYJOyRiBRHjWKAVQgC8vg+1jwsNTszf6S/jmvnO/6S
         VA7w==
X-Forwarded-Encrypted: i=1; AJvYcCVJinH9EjuU9n/PuuFAZnBjH8FGrgUbtTmovUzW/DdHORFtc4/LNkaj9DGu1u3yUIk9SNGtOh9/cEDZpJHPcKItGEOAinKJ43I=
X-Gm-Message-State: AOJu0YzWaXgFQ5IsL8u0yHdzaiJXajlyuGS3KKPE/uEK5xkCAdvltraC
	uxtqY2nkr0gstpHWiz0GYhbXuN95e2l8fgazrvr54LBhvPCL1cXjdTFtChPCWw==
X-Google-Smtp-Source: AGHT+IFL6fTS6/mCqmxtrEurBQ1YLFaYPk8pHqOxQig2U4D4mABu+nKwfCflbWupUKFaexfjmEf5MQ==
X-Received: by 2002:a05:6214:226f:b0:68c:ae97:5d2d with SMTP id gs15-20020a056214226f00b0068cae975d2dmr8628414qvb.5.1707362336476;
        Wed, 07 Feb 2024 19:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7SeR66wpk7vEz605tS3+9PYtlauZrG75cpDzlb05xTOauWAwy4Wn9+jXkF75tW5kHvEjbNHcm2b2o1nOyKsggFYVhJDjvQY9NxaQBpQs5Kg4fePQ7MxHNDeAw+cFjuF+jnP/IrX6y8MyLmEI5ql2uwSdwv/bzVN9X2CXtVj2Af3Af2/7TvTJHTpE7RfhLRnq734aBmdJZWm/qCBR9X8n7mxmk7rsml08IdqkvHjvsv8BWXQr2JxNL/brtxVG0nzML+ubCIAi5Hgvl1HD7gxV/vM0xXiVU25XR6Nx2bXihTh9/K1WjFq6GmuBCFZ7G66Nl+DTYytQYUl1c1TxC5fjELwzhqSKkNX5Z/+NC40A+OAFtlnkWwjqsN4x+TbUGQg0Mxd4WiUOeUZo9HN+KnRRKq9Z/GWF3uXcqVVCrUMOifdmDi0YVKYnMPyVdjJ6mY807Z0Om6pTwCqgKeXSVB/BJFuN4nygX0Z2VU+CSAUpLdyOOFA2YDJocOz5QBwP+PuT3ELRMjiGYDobr9fWxvMRbBN/3XhRmnwFVuBz0MY/xngJQyq6vkA9lUjg7j7m8Y4SZlHfZo7P19l1FKdOCliTMUZ6G2IUUKlpVO5ovECcU+eLElDLgGHEa5mNEc/ZAFEd/eiOS3G3g1jq1OX5yNa88vwVjUdEjahb9uPLGXJjiGwUFgt6NLF61zPGLQUIYBbvPxi44m8RonkGQEIYw/DI6Axxcc/0iDVXYf8LXAkS46GNigfwtaX+c4q9upYbjhBYwFZXSGynEW4g80lhxAlXTYsPIxObPfJGGZbZFTC9k/dAH2m2dGt2T0R8fjuWsGq7ITidT963I4doJ2k4E59ecnU8RgTE0bNlNB3zlHRURuP8kgHQa2koxsiBCOkRpx5XFKkPXh/FNtUTQUhPmzjDe78M0bD13cC2NC+Wz3WtHe8uxdY8C
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id mb10-20020a056214550a00b0068cc0b46682sm893264qvb.4.2024.02.07.19.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 19:18:56 -0800 (PST)
Date: Wed, 07 Feb 2024 22:18:55 -0500
Message-ID: <e549d87d37bbd859be59acd4fab85b43@paul-moore.com>
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
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, keyrings@vger.kernel.org, selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v9 25/25] integrity: Remove LSM
References: <20240115181809.885385-26-roberto.sassu@huaweicloud.com>
In-Reply-To: <20240115181809.885385-26-roberto.sassu@huaweicloud.com>

On Jan 15, 2024 Roberto Sassu <roberto.sassu@huaweicloud.com> wrote:
> 
> Since now IMA and EVM use their own integrity metadata, it is safe to
> remove the 'integrity' LSM, with its management of integrity metadata.
> 
> Keep the iint.c file only for loading IMA and EVM keys at boot, and for
> creating the integrity directory in securityfs (we need to keep it for
> retrocompatibility reasons).
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/integrity.h      |  14 ---
>  security/integrity/iint.c      | 197 +--------------------------------
>  security/integrity/integrity.h |  25 -----
>  security/security.c            |   2 -
>  4 files changed, 2 insertions(+), 236 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

