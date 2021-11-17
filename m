Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93694454F59
	for <lists+keyrings@lfdr.de>; Wed, 17 Nov 2021 22:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhKQVbs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 17 Nov 2021 16:31:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:15943 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233139AbhKQVbr (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 17 Nov 2021 16:31:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="233893997"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="233893997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 13:28:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; 
   d="scan'208";a="586831941"
Received: from ankushj1-mobl.amr.corp.intel.com ([10.251.8.192])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 13:28:47 -0800
Date:   Wed, 17 Nov 2021 13:28:46 -0800 (PST)
From:   Mat Martineau <mathew.j.martineau@linux.intel.com>
To:     =?ISO-8859-15?Q?Stephan_M=FCller?= <smueller@chronox.de>
cc:     herbert@gondor.apana.org.au, ebiggers@kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: Re: [PATCH v3 3/4] security: DH - remove dead code for zero
 padding
In-Reply-To: <3323567.LZWGnKmheA@positron.chronox.de>
Message-ID: <f98dbf21-50d1-7847-18cb-2f5093a8ac8@linux.intel.com>
References: <2589009.vuYhMxLoTh@positron.chronox.de> <3323567.LZWGnKmheA@positron.chronox.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1817436887-1637184527=:51702"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1817436887-1637184527=:51702
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Nov 2021, Stephan Müller wrote:

> Remove the specific code that adds a zero padding that was intended
> to be invoked when the DH operation result was smaller than the
> modulus. However, this cannot occur any more these days because the
> function mpi_write_to_sgl is used in the code path that calculates the
> shared secret in dh_compute_value. This MPI service function guarantees
> that leading zeros are introduced as needed to ensure the resulting data
> is exactly as long as the modulus. This implies that the specific code
> to add zero padding is dead code which can be safely removed.
>
> Signed-off-by: Stephan Mueller <smueller@chronox.de>
> ---
> security/keys/dh.c | 25 ++++---------------------
> 1 file changed, 4 insertions(+), 21 deletions(-)

Hi Stephan -

Thanks for the cleanup!

Acked-by: Mat Martineau <mathew.j.martineau@linux.intel.com>



>
> diff --git a/security/keys/dh.c b/security/keys/dh.c
> index 1abfa70ed6e1..56e12dae4534 100644
> --- a/security/keys/dh.c
> +++ b/security/keys/dh.c
> @@ -141,7 +141,7 @@ static void kdf_dealloc(struct kdf_sdesc *sdesc)
>  * 'dlen' must be a multiple of the digest size.
>  */
> static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
> -		   u8 *dst, unsigned int dlen, unsigned int zlen)
> +		   u8 *dst, unsigned int dlen)
> {
> 	struct shash_desc *desc = &sdesc->shash;
> 	unsigned int h = crypto_shash_digestsize(desc->tfm);
> @@ -158,22 +158,6 @@ static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
> 		if (err)
> 			goto err;
>
> -		if (zlen && h) {
> -			u8 tmpbuffer[32];
> -			size_t chunk = min_t(size_t, zlen, sizeof(tmpbuffer));
> -			memset(tmpbuffer, 0, chunk);
> -
> -			do {
> -				err = crypto_shash_update(desc, tmpbuffer,
> -							  chunk);
> -				if (err)
> -					goto err;
> -
> -				zlen -= chunk;
> -				chunk = min_t(size_t, zlen, sizeof(tmpbuffer));
> -			} while (zlen);
> -		}
> -
> 		if (src && slen) {
> 			err = crypto_shash_update(desc, src, slen);
> 			if (err)
> @@ -198,7 +182,7 @@ static int kdf_ctr(struct kdf_sdesc *sdesc, const u8 *src, unsigned int slen,
>
> static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
> 				 char __user *buffer, size_t buflen,
> -				 uint8_t *kbuf, size_t kbuflen, size_t lzero)
> +				 uint8_t *kbuf, size_t kbuflen)
> {
> 	uint8_t *outbuf = NULL;
> 	int ret;
> @@ -211,7 +195,7 @@ static int keyctl_dh_compute_kdf(struct kdf_sdesc *sdesc,
> 		goto err;
> 	}
>
> -	ret = kdf_ctr(sdesc, kbuf, kbuflen, outbuf, outbuf_len, lzero);
> +	ret = kdf_ctr(sdesc, kbuf, kbuflen, outbuf, outbuf_len);
> 	if (ret)
> 		goto err;
>
> @@ -384,8 +368,7 @@ long __keyctl_dh_compute(struct keyctl_dh_params __user *params,
> 		}
>
> 		ret = keyctl_dh_compute_kdf(sdesc, buffer, buflen, outbuf,
> -					    req->dst_len + kdfcopy->otherinfolen,
> -					    outlen - req->dst_len);
> +					    req->dst_len + kdfcopy->otherinfolen);
> 	} else if (copy_to_user(buffer, outbuf, req->dst_len) == 0) {
> 		ret = req->dst_len;
> 	} else {
> -- 
> 2.33.1
>
>
>
>
>

--
Mat Martineau
Intel
--0-1817436887-1637184527=:51702--
