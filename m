Return-Path: <keyrings+bounces-2483-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E4A691FC
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03BE7426595
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA6A1E32B9;
	Wed, 19 Mar 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QISF+K8F"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB391DA11B
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395550; cv=none; b=YXuoGEFwAU8QSovY/eHxj0p6OwL8h/i/50tX5ilPxmrOsvreYSi7f7ho5B/wTjBYL7V2BWtuN6OHvUQH1qLuxHGSE6yPJ+DaMYmfuFs0T/8YOc5iKE5wNrncNwO/VsnjqMUmKqRUMhJsGUKhlBF9x5IwRQd0qMx69Ebf2SWvdJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395550; c=relaxed/simple;
	bh=9L42q8XTVysN7xQfFBqQBdxnATYp/dyhFwRQkVx/X5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csTZXDz/B2d8cr6+Zzxe/Dd1PrH5vClkwuhhuhqc+RX51oD+c3ZovP135XJgOHgy4cY+/aBj3NNT7cSlayq846cPqRoAoz2gKRxETaErBxoQ570EbvNRoeHdK2bxyDrTPDoOXmIcEUyzrE2rZrjIieFOfatUlIXPwBON4UYiqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QISF+K8F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742395548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3uivH8PibG1oy7GS5DqSAMDJAw4T7tHzPmVv8sb0Gz0=;
	b=QISF+K8FcF5kU5ZTQtSdpM9evO/nePrXUATss7QHk13amPAIWJoJaf8OYXjkGg4wonCyBg
	SvqxyDme6BGG5eI8vtcoGO+9RrPjOm64bYUqIXYC85M+yvv96Hz8rlZDHdgQCvZeLGO5qy
	C4PbExb1QNCZY3Y5yw4DJgNBHl/98VU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-LfwgaNnmMaiQm-JyWc2ElA-1; Wed, 19 Mar 2025 10:45:46 -0400
X-MC-Unique: LfwgaNnmMaiQm-JyWc2ElA-1
X-Mimecast-MFC-AGG-ID: LfwgaNnmMaiQm-JyWc2ElA_1742395544
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso54249665e9.2
        for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 07:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395544; x=1743000344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uivH8PibG1oy7GS5DqSAMDJAw4T7tHzPmVv8sb0Gz0=;
        b=bjH6JWzNDk5WZPn/zPfQ8aIbXrA4w5ddL1AE/b4UrMaJTjyRz5dfMWTv5t8meXf5I9
         FaZLF/hTpYVoV1jdylsBSSEaaVZ9crdLUmEV3zk0lNexNgNUuHcmxwxuWU88l8a867GS
         Hn8mGoG9CDosTzGrvv7JSrGVbTwqVv6ZOlf3iOQIQVoEvsr+qnRvGn1CMfBRjVlMR9PL
         G8UkJPKxQ4a7oN5WACpt06wgkAzD+O2XtAjSjrT6eqy3Zzg1G04j8ZCXoI9VI9LHevCE
         7gtLnP+H9JQ8iKn5etZxfHDmb3gPl1rILo3M9FnjIwO09YIgxWgdiOr4THxRA9+gL2B5
         V7fw==
X-Forwarded-Encrypted: i=1; AJvYcCXP+HZHvoucDv22fq6ZIfsw6zo0jvofXCOtb2uSAuI4eXFL1RqyIyNcEh2kk/6+H9fPLw92JZFE3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5O+HsauRWg7RSyJk+fsF4+TvDdaoNd+U4dVjmLK7LnKo4n1q
	lj9HNxjoVmBnD+VFtBa3nR+/TdUkBCT9q70ZHylHXQ+lkUWms7SZX7XLQrKlt8HngvyY4KJaIQS
	6ELwXZ9GTjhLGlrENP0wSv4ySZl0A413G/S/mwPpaYoNsfScNnqesdOUW
X-Gm-Gg: ASbGnctQo1FU7JO2MZapXec4lhCEqJ60dpSmEXQA7oWpOM9qe+1dZXKJYDTPcDkdAON
	doNtC3uwoY2VanJQh50F/IHLNkp6UwnNHtOz4c6o9bGiGXbUbLXT0jE+S3sE6Sxd3WUB0yFwVtl
	z7QFPAl7Z+f0TTDTInnf/OiESTCTM6Aj2NcMhaz2UXu8ky0MLwtSlj30C197hPkz8cduxjOTulC
	C+Tsw58i8U4jddBU1PZZhry+fMcOW8Zl6i5q3fEFlsy9mcIfdAAGmhK9YLK0m2/39Qrlr9A4PIQ
	Qnw26UgF09oc9VtGMJ9Ivicqo1g=
X-Received: by 2002:a05:6000:1882:b0:391:45e9:face with SMTP id ffacd0b85a97d-39973b42580mr2717387f8f.54.1742395544462;
        Wed, 19 Mar 2025 07:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMTYIXhBJfy97j/7DcnGLMwHyGymMh+1VfCo0umRZJg9WuviL2+KVtrXsPj1uih+w+iQXU0g==
X-Received: by 2002:a05:6000:1882:b0:391:45e9:face with SMTP id ffacd0b85a97d-39973b42580mr2717360f8f.54.1742395543947;
        Wed, 19 Mar 2025 07:45:43 -0700 (PDT)
Received: from t14s (109-81-85-212.rct.o2.cz. [109.81.85.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f47bccsm20824965e9.15.2025.03.19.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:45:43 -0700 (PDT)
Date: Wed, 19 Mar 2025 15:44:19 +0100
From: Jan Stancek <jstancek@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
Message-ID: <Z9rYQy3l5V5cvW7W@t14s>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn>
 <2025031943-disparity-dash-cfa3@gregkh>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2025031943-disparity-dash-cfa3@gregkh>

On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
>On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
>> From: Jan Stancek <jstancek@redhat.com>
>>
>> commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
>>
>> ENGINE API has been deprecated since OpenSSL version 3.0 [1].
>> Distros have started dropping support from headers and in future
>> it will likely disappear also from library.
>>
>> It has been superseded by the PROVIDER API, so use it instead
>> for OPENSSL MAJOR >= 3.
>>
>> [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
>>
>> [jarkko: fixed up alignment issues reported by checkpatch.pl --strict]
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
>>  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
>>  2 files changed, 138 insertions(+), 58 deletions(-)
>
>This seems to differ from what is upstream by a lot, please document
>what you changed from it and why when you resend this series again.

Hunks are arranged differently, but code appears to be identical.
When I apply the series to v6.6.83 and compare with upstream I get:

$ git range-diff HEAD~3..HEAD 558bdc45dfb2~3..558bdc45dfb2
1:  02ea9f7368c6 ! 1:  300e6d4116f9 sign-file,extract-cert: move common SSL helper functions to a header
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: move common SSL helper functions to a header

     -    commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.
     -
          Couple error handling helpers are repeated in both tools, so
          move them to a common header.

     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## MAINTAINERS ##
      @@ MAINTAINERS: S: Maintained
2:  0a81fb059cfd ! 2:  467d60eddf55 sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: avoid using deprecated ERR_get_error_line()

     -    commit 467d60eddf55588add232feda325da7215ddaf30 upstream.
     -
          ERR_get_error_line() is deprecated since OpenSSL 3.0.

          Use ERR_peek_error_line() instead, and combine display_openssl_errors()
     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## certs/extract-cert.c ##
      @@ certs/extract-cert.c: int main(int argc, char **argv)
3:  0882f379a1f5 ! 3:  558bdc45dfb2 sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
     @@ Metadata
       ## Commit message ##
          sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3

     -    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
     -
          ENGINE API has been deprecated since OpenSSL version 3.0 [1].
          Distros have started dropping support from headers and in future
          it will likely disappear also from library.
     @@ Commit message
          Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
          Reviewed-by: Neal Gompa <neal@gompa.dev>
          Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
     -    Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

       ## certs/extract-cert.c ##
      @@

Regards,
Jan


