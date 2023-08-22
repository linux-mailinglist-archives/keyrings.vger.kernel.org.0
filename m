Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7B678414B
	for <lists+keyrings@lfdr.de>; Tue, 22 Aug 2023 14:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbjHVM4C (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 22 Aug 2023 08:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbjHVM4B (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 22 Aug 2023 08:56:01 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFDACD6
        for <keyrings@vger.kernel.org>; Tue, 22 Aug 2023 05:55:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50087d47d4dso1823806e87.1
        for <keyrings@vger.kernel.org>; Tue, 22 Aug 2023 05:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692708957; x=1693313757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3KoBISRC3A8VLVGCVV3tR+5wTWoeEGilZejzXYvgBsw=;
        b=klsqRMhpdt6ISIYJ5BIId/pjYf4AJhUg8yoLERaflRX7km1el7e1Yj7IDwYT80ZlBC
         I3mIqF60sgKckN7MPyYZTlWgIFqMpZVcHNnL96kgrSdqphWzWvwTqbvNsa3if+r/9Kj3
         RRAEBABne5eIaRv9G+4O6jcBaxfKEDoS5yjyuMUg+z9fFGygp/XD1vP4IqR8XlaoLy5T
         Ww7JqjqAjMrV8zsEDuZYMmMhtgDGPoGKBXWt4ce05noLWA2RvnWmwj6wsP0dRhMBnB99
         kIlEuBEH8xFuar2+TCgALctxvhcQue7PxbJacjfoRWVmLH+/xLwBSnRBpiqcjrUtOFTj
         CWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692708957; x=1693313757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KoBISRC3A8VLVGCVV3tR+5wTWoeEGilZejzXYvgBsw=;
        b=Q6esovsRQzzS+qFTt4Z/VnGdt+CtiUNeVMzH6jsHvum8vty8gHuzvXXvoWl8AgU5mW
         9Bk7LbI311IImmeqU19qTDbgf/7Xw73/1VhYdbPH25uC5jOMqTzyxDVxS6KhUySTJqRd
         iINS/MUQbXe72uLcUE4wFe4QBfswzMXqEBQhCQu9/qVPC/3YaKeP1CGNOmOY/3c9yX9O
         T1UnjfnoBsXSIkxhISQPH+DKq5cKXNeQ7xQRlkivBwcXcFXM2WmmC/VBip1UqqHRiMFu
         UJg53BSWIr6yp09auLaC1lrq0e5sf/83hiC8OvQFalObkVoR2iGyW3hjXFAqdPXrHbbe
         AyYg==
X-Gm-Message-State: AOJu0Yz5h5MEDvM8AvTaJO93gUAtTLjUdob1xDiU0eVCH32WEKDpK9I2
        32GU3Up2fV2IpOqcrC9JEFmPcw==
X-Google-Smtp-Source: AGHT+IFNBk+xnnpO2QNBmcgZSn1n7BzTLOXF8Qc/I/E/+r68TpKnLhsmXBDnYmr83wQR1A3UgKlg5w==
X-Received: by 2002:a05:6512:1192:b0:4fc:265d:fc62 with SMTP id g18-20020a056512119200b004fc265dfc62mr9122363lfr.18.1692708957360;
        Tue, 22 Aug 2023 05:55:57 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id p6-20020a19f006000000b004fdb913af80sm2185580lfc.209.2023.08.22.05.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 05:55:56 -0700 (PDT)
Date:   Tue, 22 Aug 2023 14:55:55 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        jarkko@kernel.org, jejb@linux.ibm.com, zohar@linux.ibm.com,
        sudeep.holla@arm.com, achin.gupta@arm.com,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: trusted: tee: Refactor register SHM usage
Message-ID: <20230822125555.GA82256@rayden>
References: <20230822112933.1550062-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230822112933.1550062-1-sumit.garg@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Aug 22, 2023 at 04:59:33PM +0530, Sumit Garg wrote:
> The OP-TEE driver using the old SMC based ABI permits overlapping shared
> buffers, but with the new FF-A based ABI each physical page may only
> be registered once.
> 
> As the key and blob buffer are allocated adjancently, there is no need
> for redundant register shared memory invocation. Also, it is incompatibile
> with FF-A based ABI limitation. So refactor register shared memory
> implementation to use only single invocation to register both key and blob
> buffers.
> 
> Fixes: 4615e5a34b95 ("optee: add FF-A support")
> Reported-by: Jens Wiklander <jens.wiklander@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  security/keys/trusted-keys/trusted_tee.c | 64 ++++++++----------------
>  1 file changed, 20 insertions(+), 44 deletions(-)
> 
> diff --git a/security/keys/trusted-keys/trusted_tee.c b/security/keys/trusted-keys/trusted_tee.c
> index ac3e270ade69..aa3d477de6db 100644
> --- a/security/keys/trusted-keys/trusted_tee.c
> +++ b/security/keys/trusted-keys/trusted_tee.c
> @@ -65,24 +65,16 @@ static int trusted_tee_seal(struct trusted_key_payload *p, char *datablob)
>  	int ret;
>  	struct tee_ioctl_invoke_arg inv_arg;
>  	struct tee_param param[4];
> -	struct tee_shm *reg_shm_in = NULL, *reg_shm_out = NULL;
> +	struct tee_shm *reg_shm = NULL;
>  
>  	memset(&inv_arg, 0, sizeof(inv_arg));
>  	memset(&param, 0, sizeof(param));
>  
> -	reg_shm_in = tee_shm_register_kernel_buf(pvt_data.ctx, p->key,
> -						 p->key_len);
> -	if (IS_ERR(reg_shm_in)) {
> -		dev_err(pvt_data.dev, "key shm register failed\n");
> -		return PTR_ERR(reg_shm_in);
> -	}
> -
> -	reg_shm_out = tee_shm_register_kernel_buf(pvt_data.ctx, p->blob,
> -						  sizeof(p->blob));
> -	if (IS_ERR(reg_shm_out)) {
> -		dev_err(pvt_data.dev, "blob shm register failed\n");
> -		ret = PTR_ERR(reg_shm_out);
> -		goto out;
> +	reg_shm = tee_shm_register_kernel_buf(pvt_data.ctx, p->key,
> +					      sizeof(p->key) + sizeof(p->blob));

This is somewhat fragile. What if struct trusted_key_payload has a small
unexpected change in layout?

Thanks,
Jens

> +	if (IS_ERR(reg_shm)) {
> +		dev_err(pvt_data.dev, "shm register failed\n");
> +		return PTR_ERR(reg_shm);
>  	}
>  
>  	inv_arg.func = TA_CMD_SEAL;
> @@ -90,13 +82,13 @@ static int trusted_tee_seal(struct trusted_key_payload *p, char *datablob)
>  	inv_arg.num_params = 4;
>  
>  	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> -	param[0].u.memref.shm = reg_shm_in;
> +	param[0].u.memref.shm = reg_shm;
>  	param[0].u.memref.size = p->key_len;
>  	param[0].u.memref.shm_offs = 0;
>  	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
> -	param[1].u.memref.shm = reg_shm_out;
> +	param[1].u.memref.shm = reg_shm;
>  	param[1].u.memref.size = sizeof(p->blob);
> -	param[1].u.memref.shm_offs = 0;
> +	param[1].u.memref.shm_offs = sizeof(p->key);
>  
>  	ret = tee_client_invoke_func(pvt_data.ctx, &inv_arg, param);
>  	if ((ret < 0) || (inv_arg.ret != 0)) {
> @@ -107,11 +99,7 @@ static int trusted_tee_seal(struct trusted_key_payload *p, char *datablob)
>  		p->blob_len = param[1].u.memref.size;
>  	}
>  
> -out:
> -	if (reg_shm_out)
> -		tee_shm_free(reg_shm_out);
> -	if (reg_shm_in)
> -		tee_shm_free(reg_shm_in);
> +	tee_shm_free(reg_shm);
>  
>  	return ret;
>  }
> @@ -124,24 +112,16 @@ static int trusted_tee_unseal(struct trusted_key_payload *p, char *datablob)
>  	int ret;
>  	struct tee_ioctl_invoke_arg inv_arg;
>  	struct tee_param param[4];
> -	struct tee_shm *reg_shm_in = NULL, *reg_shm_out = NULL;
> +	struct tee_shm *reg_shm = NULL;
>  
>  	memset(&inv_arg, 0, sizeof(inv_arg));
>  	memset(&param, 0, sizeof(param));
>  
> -	reg_shm_in = tee_shm_register_kernel_buf(pvt_data.ctx, p->blob,
> -						 p->blob_len);
> -	if (IS_ERR(reg_shm_in)) {
> -		dev_err(pvt_data.dev, "blob shm register failed\n");
> -		return PTR_ERR(reg_shm_in);
> -	}
> -
> -	reg_shm_out = tee_shm_register_kernel_buf(pvt_data.ctx, p->key,
> -						  sizeof(p->key));
> -	if (IS_ERR(reg_shm_out)) {
> -		dev_err(pvt_data.dev, "key shm register failed\n");
> -		ret = PTR_ERR(reg_shm_out);
> -		goto out;
> +	reg_shm = tee_shm_register_kernel_buf(pvt_data.ctx, p->key,
> +					      sizeof(p->key) + sizeof(p->blob));
> +	if (IS_ERR(reg_shm)) {
> +		dev_err(pvt_data.dev, "shm register failed\n");
> +		return PTR_ERR(reg_shm);
>  	}
>  
>  	inv_arg.func = TA_CMD_UNSEAL;
> @@ -149,11 +129,11 @@ static int trusted_tee_unseal(struct trusted_key_payload *p, char *datablob)
>  	inv_arg.num_params = 4;
>  
>  	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
> -	param[0].u.memref.shm = reg_shm_in;
> +	param[0].u.memref.shm = reg_shm;
>  	param[0].u.memref.size = p->blob_len;
> -	param[0].u.memref.shm_offs = 0;
> +	param[0].u.memref.shm_offs = sizeof(p->key);
>  	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
> -	param[1].u.memref.shm = reg_shm_out;
> +	param[1].u.memref.shm = reg_shm;
>  	param[1].u.memref.size = sizeof(p->key);
>  	param[1].u.memref.shm_offs = 0;
>  
> @@ -166,11 +146,7 @@ static int trusted_tee_unseal(struct trusted_key_payload *p, char *datablob)
>  		p->key_len = param[1].u.memref.size;
>  	}
>  
> -out:
> -	if (reg_shm_out)
> -		tee_shm_free(reg_shm_out);
> -	if (reg_shm_in)
> -		tee_shm_free(reg_shm_in);
> +	tee_shm_free(reg_shm);
>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 
