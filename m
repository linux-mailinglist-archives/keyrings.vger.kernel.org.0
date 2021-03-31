Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4505F350A99
	for <lists+keyrings@lfdr.de>; Thu,  1 Apr 2021 01:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhCaXNf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 31 Mar 2021 19:13:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhCaXNO (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 31 Mar 2021 19:13:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CE2760FE8;
        Wed, 31 Mar 2021 23:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617232393;
        bh=8tenvRLSfJsN0kvZ2jkfZemaePWY+JI0zsmmOYXQJ0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ooZGAaYjlPs4i61oFkp5lRQ7p2EcWL9MuI6+fbS3mdCSn91aYN9TYxlnLhKgFRONw
         gXlbZdvE9p2vslGAV6LPXYtLcPJ8/Eyj//w5x1Lxa40EsAEenMdOibravm+RYN6dBU
         766vdHhCPQBfz8sJcofKwA6HyrjRmmQ0buM2w98ndh4xFxp/mxsnS3B7v4W8UBSJEw
         uec7ILJ/Qxp+V5/RUhA0LJWknZoMbhEN8cjq2AeqHWi2P77UBTjy0sQWeyzWQUA/en
         Q4KlUk0cOmboOxEeRbc4cdTgRq6jWwPGtBXdxu9JyBnH/rE+C0DQWPk/21q+Ig7+vr
         3aWAbkKYBE/Hw==
Date:   Thu, 1 Apr 2021 02:13:11 +0300
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH 18/18] keyctl_pkey: Add pkey parameter slen to pass in
 PSS salt length
Message-ID: <YGUCB1jKCPvn60n2@kernel.org>
References: <20210330202829.4825-1-varad.gautam@suse.com>
 <20210330202829.4825-19-varad.gautam@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330202829.4825-19-varad.gautam@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 30, 2021 at 10:28:29PM +0200, Varad Gautam wrote:
> keyctl pkey_* operations accept enc and hash parameters at present.
> RSASSA-PSS signatures also require passing in the signature salt
> length.
> 
> Add another parameter 'slen' to feed in salt length of a PSS
> signature.
> 
> Signed-off-by: Varad Gautam <varad.gautam@suse.com>
> ---


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko

>  crypto/asymmetric_keys/asymmetric_type.c | 1 +
>  include/linux/keyctl.h                   | 1 +
>  security/keys/keyctl_pkey.c              | 6 ++++++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
> index ad8af3d70ac0..eb2ef4a07f8e 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -571,6 +571,7 @@ static int asymmetric_key_verify_signature(struct kernel_pkey_params *params,
>  		.hash_algo	= params->hash_algo,
>  		.digest		= (void *)in,
>  		.s		= (void *)in2,
> +		.salt_length	= params->slen,
>  	};
>  
>  	return verify_signature(params->key, &sig);
> diff --git a/include/linux/keyctl.h b/include/linux/keyctl.h
> index 5b79847207ef..970c7bed3082 100644
> --- a/include/linux/keyctl.h
> +++ b/include/linux/keyctl.h
> @@ -37,6 +37,7 @@ struct kernel_pkey_params {
>  		__u32	in2_len;	/* 2nd input data size (verify) */
>  	};
>  	enum kernel_pkey_operation op : 8;
> +	__u32		slen;
>  };
>  
>  #endif /* __LINUX_KEYCTL_H */
> diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
> index 5de0d599a274..b54a021e16b1 100644
> --- a/security/keys/keyctl_pkey.c
> +++ b/security/keys/keyctl_pkey.c
> @@ -24,11 +24,13 @@ enum {
>  	Opt_err,
>  	Opt_enc,		/* "enc=<encoding>" eg. "enc=oaep" */
>  	Opt_hash,		/* "hash=<digest-name>" eg. "hash=sha1" */
> +	Opt_slen,		/* "slen=<salt-length>" eg. "slen=32" */
>  };
>  
>  static const match_table_t param_keys = {
>  	{ Opt_enc,	"enc=%s" },
>  	{ Opt_hash,	"hash=%s" },
> +	{ Opt_slen,	"slen=%u" },
>  	{ Opt_err,	NULL }
>  };
>  
> @@ -63,6 +65,10 @@ static int keyctl_pkey_params_parse(struct kernel_pkey_params *params)
>  			params->hash_algo = q;
>  			break;
>  
> +		case Opt_slen:
> +			if (kstrtouint(q, 0, &params->slen))
> +				return -EINVAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> -- 
> 2.30.2
> 
> 
