Return-Path: <keyrings+bounces-2858-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F850AEA1CB
	for <lists+keyrings@lfdr.de>; Thu, 26 Jun 2025 17:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C534E1C614D2
	for <lists+keyrings@lfdr.de>; Thu, 26 Jun 2025 14:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AD22ECEBE;
	Thu, 26 Jun 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OoE0pHQk"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785E2ED145
	for <keyrings@vger.kernel.org>; Thu, 26 Jun 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949361; cv=none; b=lFq//iDGMb9H7QXhyGqqNNLcrSwzz1rUd8TdWPGJhHjOBw4UKkS9zan1JnTOerZdrk3/oBk/oFaWJfrql2g5s4wTsJigZ+OI1/148OoPPj+o+Vl1oG+FgdJTPocJ4IKTpf+uCysPmUPZXCimUL2k8Sul3GdbP3felqMatm19eBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949361; c=relaxed/simple;
	bh=e+p1u3bjk72DZ4xXV4yRymVTRZjUSFmGtt4UT1KJy4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8u+qVqq/8HBjFAuTIHOtl8z5k3a6eKYjvW554bcpi28LwzRcNwYF7KZtLoIoNjAIwNeoe2Q7z8dp7w9UpXjksgNCM6BkMwYwRuTgImi16FfsAKBfMZL31/d86HzYqCT6Mnci/MMteDA4OBkizsNKPixAS9h31r8Qxc2lK89Bi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OoE0pHQk; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40b31468da3so38620b6e.0
        for <keyrings@vger.kernel.org>; Thu, 26 Jun 2025 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750949357; x=1751554157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDTHGKJ7PRnQtifJssL8JUIIPtKYbrBYEt3PvsupNKg=;
        b=OoE0pHQkKhw4hvO00e7lyvZUJjgpBMreXb6Jk35+vlUH2IE5UYZqaqLSQHU/nibg6v
         ruXqxLbVMqM1vytrKhJtNrqEDD6h6rXPgBiryqmNYLC3IQnZIhuOS7TcPwGr5R7ygKs1
         lWTtvGDk6W0KewJgH+hGGwveddIggSzeYH22jvTTUIxPsmaKjGdaoU/MlO0VHJ95ibm8
         knVzbKenulkmq7F+9uZ5iBaho2oUTnB1Fx9YeiEBCInT5w6yq1OERaErbJt1TU1W9RXL
         JVbdr/2nbDQR2i1Zix/oN3aQ7XelMgfOCuorezM/K2rl/XlBSx5xdT0WppNl72JmrNT7
         FlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949357; x=1751554157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDTHGKJ7PRnQtifJssL8JUIIPtKYbrBYEt3PvsupNKg=;
        b=RQbiUa0Gi/m7gFh1HcNp5lvJYNClVKvJQEA6Up84hS6hyOSJ/uFQlZyh2gBH7SEtcO
         gYChU/jiE3DL8XbhMoihho/7FwP3LTzQoSDRU+Zs5nvTubGefqqOehj530UUv/bIpLkB
         tfakD/DK7D0WfRxmCzU9df+7Ox/iB69ay1zJ4RWHDTQGXpiYg55wqb4BqgGi1Co3mSUa
         QJOfOcIblVEJZzna6mf3vDMfJq/Dj8nWnI8OoX3z/81Glu+p5kUx8y8mM/OZeB/KlPZQ
         wTWeOhe04mVggU1kWOiYqyij0qnaMvZmVw/9sfLuaW8eddmpa4bBPr07cEAN7WvLHjl0
         B25A==
X-Forwarded-Encrypted: i=1; AJvYcCXzW/uAI8V9kJYve0lU2ur7AU0NQvGpi+HLnyQzkjdpK6Dry5utLhRClRXpmPYcqBYk6l96NlGCcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyubrwAmDt8+SKcxCljaVUWWqg3cpQZhEz7irqeaBMWOYyidtbC
	msZF5jmp6IDHsheezX7i5Qq64OhTlT295RgNzMPwFC6IC4oHMAWvuNblif6ga64Csm4=
X-Gm-Gg: ASbGncvvwMbl5vKIKbH4jq0yV9Rs960O2AOGJt004rpg6phuQqd49DmJzxajXvxz4LM
	ycNEC0Gdz1RJyX4wiN//UQ1l0LjELXstrpj+vpTepNSxEFties8/3S/4qtFskwcOesbq/1zurpT
	fPl2VTjCtQWV//YkiXUIWVWjwuA7sESczygiB5GgyaizqJsOoKVgnDFUaAK+djiOCO4u4DV7emJ
	7iKaD+m/m9Mu4v99CgBmA/kprmm2Ou5L6DDH4vKzfBDzTLYnkiBFnVaDC0DlGRGp9Hlgj3yOK+4
	pheUC4lky9OlkAfWn1+nscMESURPBQFnG/jOZBZo+mrQ+EU=
X-Google-Smtp-Source: AGHT+IEk1fuPkxL2WLgf9P7Tgn7/Q5tUITHrfb7oE7/rJ7NBa+jsmVtdMJzdRWUlmWV91MQIQpsO/Q==
X-Received: by 2002:a05:6808:50ac:b0:406:7186:5114 with SMTP id 5614622812f47-40b05c73cf1mr5460261b6e.36.1750949357253;
        Thu, 26 Jun 2025 07:49:17 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c136ecsm2593994b6e.6.2025.06.26.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:49:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uUnud-00000001WeQ-0wX2;
	Thu, 26 Jun 2025 11:49:15 -0300
Date: Thu, 26 Jun 2025 11:49:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"open list:TPM DEVICE DRIVER" <linux-integrity@vger.kernel.org>,
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH] tpm: Create cleanup class for tpm_buf
Message-ID: <20250626144915.GD213144@ziepe.ca>
References: <20250625213757.1236570-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625213757.1236570-1-jarkko@kernel.org>

On Thu, Jun 26, 2025 at 12:37:56AM +0300, Jarkko Sakkinen wrote:
> @@ -323,7 +323,7 @@ unsigned long tpm1_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal)
>   */
>  static int tpm1_startup(struct tpm_chip *chip)
>  {
> -	struct tpm_buf buf;
> +	CLASS(tpm_buf, buf)();
>  	int rc;
>  
>  	dev_info(&chip->dev, "starting up the TPM manually\n");
> @@ -335,7 +335,6 @@ static int tpm1_startup(struct tpm_chip *chip)
>  	tpm_buf_append_u16(&buf, TPM_ST_CLEAR);
>  
>  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to start the TPM");
> -	tpm_buf_destroy(&buf);
>  	return rc;
>  }

So, Linus has spoken negatively about just converting existing code to
use cleanup.h, fearful it would introduce more bugs.

I would certainly split this into more patches, and it would be nice
if something mechanical like coccinelle could do the change.

At least I would add the class and drop the tpm_buf_destroy() as one
patch, and another would be to cleanup any empty gotos.

Also, I think the style guide for cleanup.h is to not use the
variable block, so it should be more like:

CLASS(tpm_buf, buf)();
if (!tpm_buf)
   return -ENOMEM;

AFAICT, but that seems to be some kind of tribal knowledge.

Jason

