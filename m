Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C6E1D3789
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 19:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENRGf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 13:06:35 -0400
Received: from sonic309-27.consmr.mail.ne1.yahoo.com ([66.163.184.153]:34190
        "EHLO sonic309-27.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726632AbgENRGe (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 13:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589475993; bh=ywS9qtv92ULtIUX+IJVNzAMPyJHQMKJsF/Xjtg52W9o=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject; b=DQcrFaKSIhsb21kjfO3auFpJWAvJmspFHvcXa6G+6brIJs0NKyfRa6J1NXix+z7LnVxhIVyzAMe4my677gX68anBQffl5aVuaPJCNKnN/oICaPnr9mLKesZmfITxn7OZIT8pwI15ox/K0CmLAS3T4fWE3fg/N12SPBtE5KLVi8R2Hstmb/7HCLyspM3qU2mAinlwY6OYqfVs5ljlXkKV/dljutbEITxFZu3iKs9ERYon3Cg5by8HLhJi7VUVtgBcGERMl7+qnkKxMhEDQlQSPFheLa35UB3Mp8/4nprx1M1O0FI5U3jzyFVn8l9fmuVVEPpki51TTG6NVvJSNiUVHQ==
X-YMail-OSG: EMvjKngVM1n5QKhJt54phHMWN.X6AEm2VYm8fOY3XFbOwZmO7BDs_p0LIMwkUKB
 d9HQA4pLMkH0AkzHpUn9FGM1z4qtnKnhUURaQ4unK3040foGl_VxNs6i.EUsudAWcgY0X1OAyeik
 SLiZaFhsVsbeX2ixhMa7rMNreBszGssn21PdGyjv4JmOhgkLDkiV0Le0jy.0YYgyrM8gITtluqic
 yiL19aFQ9UNL2T_vAbNo4knYtvGIEXtI9I4yyWXrLvEgOtMLU_mdk5OgvynuElAS8OPnGauUTUzm
 E6bKy.Gcy08SboifFGs6s4zA6DMNz_I9wuJX1K2W1NSkGI3GIepdGkk0AwhHsoclhssIb1RziOyp
 SGcJFG.IMiwV58f.WvgzHVFavd47xBf7PI07V5S.5d6M08d96d21o_cra8NLrpNiZI7u5wIc3rbF
 30XdAhQ9.SM.XdhAQA7NlPnf4bqg4PLinEXcVW29N8KM1qOkhsFbMi.xtQyhW5Ou3Ba0du.QNGBf
 0a4PRU41GKiE40EAYLYfPihS4AaEZ7NaOU_gEOlC3m_h3msjDKY0jphwdThFMU0.qPCZgsLswpPJ
 GCh3Yey8i6WQp3blE3eRuPnTR4ehUQxr8itjMPwessI0rRXv8_JAI.Mow2zNqTCUGTrChb73ycCj
 LLDdZyM1x0vkrKyLwVR6_jfCXR9s4pa9M6bbzLKkrZ7naYU4ABpWbNbahQnOX7LYMqRsGLvLWyW1
 g9fw1Br8X51iHOevAmKCmkRhmFy1qYtfc8CwBxNW_Uqu5Rs6ZlgzPO1cX_6668nEAQ7j3ahZpaZ4
 FzT.C7AU.GcHatEnP3VLxze5xfaEixMK_tzleASEJukEdL1QqpByFVEnqj5S7OjvO5rfhCU56jSI
 bg2HcTbf9Hf8NUyM827Vn8whgu5__6IO9QFX2nzrH0ozWHDcnxv_MOwyCLYu88tzWwyPgYEPZmZo
 4iFwaPQjn2GL2YrYSLW.AbhkDCf4SD.2MZsjgjjGvIlrsn_ilJY_8NrO9m7bTfmrUc.3cIsJICbM
 hrwgtKY8KuX0Wd2bcAkGaRCZPWmx8N5_EP9HODzZ_UZ9HTqsszhSCnf0f5SiZKmJFL5umBxwZ5i5
 s4g3_pee7a2zJt6xt2Df0Mtd5JD8k6jIJ02T2qTJ6tvV8WbIdOZMxAtVnDYRCmKRslDstzoxNneh
 3.p64Ihom2wvZ24lO11WcHsCm85QBGIXDF4q50qeKkxh3xK6bo7nvSv_DWKbRpfqkfTZjXHsnnUn
 _hFiJRt3JS.aM3JOBfRMVBN_f75oxuoBKAhuG.AO4OYHEa5i4H65v5k8R3aCMa4dK7KBjJXPefDZ
 f9JaWPJxci2s8iPIBn_VOv11rEHG6unyzaQMsxkS6q2RDU5CQA60I_LiF4fNVaNOQGNVP86QtCbb
 c9nVVOqoQYhwbFBcoq2BFtOpZy8E-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Thu, 14 May 2020 17:06:33 +0000
Received: by smtp412.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID fc92533db0efb0f134e119ba56e9dc08;
          Thu, 14 May 2020 17:06:29 +0000 (UTC)
Subject: Re: [PATCH] keys: Move permissions checking decisions into the
 checking code
To:     David Howells <dhowells@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>
References: <CAEjxPJ4=ZN_jKP2nX5mrMA3OxC8XLsYEmCPCD-78H4XQw=_hCA@mail.gmail.com>
 <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
 <158932282880.2885325.2688622278854566047.stgit@warthog.procyon.org.uk>
 <3999877.1589475539@warthog.procyon.org.uk>
From:   Casey Schaufler <casey@schaufler-ca.com>
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 mQINBFzV9HABEAC/mmv3jeJyF7lR7QhILYg1+PeBLIMZv7KCzBSc/4ZZipoWdmr77Lel/RxQ
 1PrNx0UaM5r6Hj9lJmJ9eg4s/TUBSP67mTx+tsZ1RhG78/WFf9aBe8MSXxY5cu7IUwo0J/CG
 vdSqACKyYPV5eoTJmnMxalu8/oVUHyPnKF3eMGgE0mKOFBUMsb2pLS/enE4QyxhcZ26jeeS6
 3BaqDl1aTXGowM5BHyn7s9LEU38x/y2ffdqBjd3au2YOlvZ+XUkzoclSVfSR29bomZVVyhMB
 h1jTmX4Ac9QjpwsxihT8KNGvOM5CeCjQyWcW/g8LfWTzOVF9lzbx6IfEZDDoDem4+ZiPsAXC
 SWKBKil3npdbgb8MARPes2DpuhVm8yfkJEQQmuLYv8GPiJbwHQVLZGQAPBZSAc7IidD2zbf9
 XAw1/SJGe1poxOMfuSBsfKxv9ba2i8hUR+PH7gWwkMQaQ97B1yXYxVEkpG8Y4MfE5Vd3bjJU
 kvQ/tOBUCw5zwyIRC9+7zr1zYi/3hk+OG8OryZ5kpILBNCo+aePeAJ44znrySarUqS69tuXd
 a3lMPHUJJpUpIwSKQ5UuYYkWlWwENEWSefpakFAIwY4YIBkzoJ/t+XJHE1HTaJnRk6SWpeDf
 CreF3+LouP4njyeLEjVIMzaEpwROsw++BX5i5vTXJB+4UApTAQARAQABtChDYXNleSBTY2hh
 dWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+iQJUBBMBCAA+FiEEC+9tH1YyUwIQzUIe
 OKUVfIxDyBEFAlzV9HACGwMFCRLMAwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQOKUV
 fIxDyBG6ag/6AiRl8yof47YOEVHlrmewbpnlBTaYNfJ5cZflNRKRX6t4bp1B2YV1whlDTpiL
 vNOwFkh+ZE0eI5M4x8Gw2Oiok+4Q5liA9PHTozQYF+Ia+qdL5EehfbLGoEBqklpGvG3h8JsO
 7SvONJuFDgvab/U/UriDYycJwzwKZuhVtK9EMpnTtUDyP3DY+Q8h7MWsniNBLVXnh4yBIEJg
 SSgDn3COpZoFTPGKE+rIzioo/GJe8CTa2g+ZggJiY/myWTS3quG0FMvwvNYvZ4I2g6uxSl7n
 bZVqAZgqwoTAv1HSXIAn9muwZUJL03qo25PFi2gQmX15BgJKQcV5RL0GHFHRThDS3IyadOgK
 P2j78P8SddTN73EmsG5OoyzwZAxXfck9A512BfVESqapHurRu2qvMoUkQaW/2yCeRQwGTsFj
 /rr0lnOBkyC6wCmPSKXe3dT2mnD5KnCkjn7KxLqexKt4itGjJz4/ynD/qh+gL7IPbifrQtVH
 JI7cr0fI6Tl8V6efurk5RjtELsAlSR6fKV7hClfeDEgLpigHXGyVOsynXLr59uE+g/+InVic
 jKueTq7LzFd0BiduXGO5HbGyRKw4MG5DNQvC//85EWmFUnDlD3WHz7Hicg95D+2IjD2ZVXJy
 x3LTfKWdC8bU8am1fi+d6tVEFAe/KbUfe+stXkgmfB7pxqW5Ag0EXNX0cAEQAPIEYtPebJzT
 wHpKLu1/j4jQcke06Kmu5RNuj1pEje7kX5IKzQSs+CPH0NbSNGvrA4dNGcuDUTNHgb5Be9hF
 zVqRCEvF2j7BFbrGe9jqMBWHuWheQM8RRoa2UMwQ704mRvKr4sNPh01nKT52ASbWpBPYG3/t
 WbYaqfgtRmCxBnqdOx5mBJIBh9Q38i63DjQgdNcsTx2qS7HFuFyNef5LCf3jogcbmZGxG/b7
 yF4OwmGsVc8ufvlKo5A9Wm+tnRjLr/9Mn9vl5Xa/tQDoPxz26+aWz7j1in7UFzAarcvqzsdM
 Em6S7uT+qy5jcqyuipuenDKYF/yNOVSNnsiFyQTFqCPCpFihOnuaWqfmdeUOQHCSo8fD4aRF
 emsuxqcsq0Jp2ODq73DOTsdFxX2ESXYoFt3Oy7QmIxeEgiHBzdKU2bruIB5OVaZ4zWF+jusM
 Uh+jh+44w9DZkDNjxRAA5CxPlmBIn1OOYt1tsphrHg1cH1fDLK/pDjsJZkiH8EIjhckOtGSb
 aoUUMMJ85nVhN1EbU/A3DkWCVFEA//Vu1+BckbSbJKE7Hl6WdW19BXOZ7v3jo1q6lWwcFYth
 esJfk3ZPPJXuBokrFH8kqnEQ9W2QgrjDX3et2WwZFLOoOCItWxT0/1QO4ikcef/E7HXQf/ij
 Dxf9HG2o5hOlMIAkJq/uLNMvABEBAAGJAjwEGAEIACYWIQQL720fVjJTAhDNQh44pRV8jEPI
 EQUCXNX0cAIbDAUJEswDAAAKCRA4pRV8jEPIEWkzEACKFUnpp+wIVHpckMfBqN8BE5dUbWJc
 GyQ7wXWajLtlPdw1nNw0Wrv+ob2RCT7qQlUo6GRLcvj9Fn5tR4hBvR6D3m8aR0AGHbcC62cq
 I7LjaSDP5j/em4oVL2SMgNTrXgE2w33JMGjAx9oBzkxmKUqprhJomPwmfDHMJ0t7y39Da724
 oLPTkQDpJL1kuraM9TC5NyLe1+MyIxqM/8NujoJbWeQUgGjn9uxQAil7o/xSCjrWCP3kZDID
 vd5ZaHpdl8e1mTExQoKr4EWgaMjmD/a3hZ/j3KfTVNpM2cLfD/QwTMaC2fkK8ExMsz+rUl1H
 icmcmpptCwOSgwSpPY1Zfio6HvEJp7gmDwMgozMfwQuT9oxyFTxn1X3rn1IoYQF3P8gsziY5
 qtTxy2RrgqQFm/hr8gM78RhP54UPltIE96VywviFzDZehMvuwzW//fxysIoK97Y/KBZZOQs+
 /T+Bw80Pwk/dqQ8UmIt2ffHEgwCTbkSm711BejapWCfklxkMZDp16mkxSt2qZovboVjXnfuq
 wQ1QL4o4t1hviM7LyoflsCLnQFJh6RSBhBpKQinMJl/z0A6NYDkQi6vEGMDBWX/M2vk9Jvwa
 v0cEBfY3Z5oFgkh7BUORsu1V+Hn0fR/Lqq/Pyq+nTR26WzGDkolLsDr3IH0TiAVH5ZuPxyz6
 abzjfg==
Message-ID: <bf760071-0b34-41e7-1bc0-7c4d85d9bc8a@schaufler-ca.com>
Date:   Thu, 14 May 2020 10:06:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3999877.1589475539@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailer: WebService/1.1.15941 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 5/14/2020 9:58 AM, David Howells wrote:
> How about this then?
>
> David
> ---
> commit fa37b6c7e2f86d16ede1e0e3cb73857152d51825
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu May 14 17:48:55 2020 +0100
>
>     keys: Move permissions checking decisions into the checking code
>     
>     Overhaul the permissions checking, moving the decisions of which permits to
>     request for what operation and what overrides to allow into the permissions
>     checking functions in keyrings, SELinux and Smack.
>     
>     To this end, the KEY_NEED_* constants are turned into an enum and expanded
>     in number to cover operation types individually.
>     
>     Note that some more tweaking is probably needed to separate kernel uses,
>     e.g. AFS using rxrpc keys, from direct userspace users.
>     
>     Some overrides are available and this needs to be handled specially:
>     
>      (1) KEY_FLAG_KEEP in key->flags - The key may not be deleted and/or things
>          may not be removed from the keyring.
>     
>      (2) KEY_FLAG_ROOT_CAN_CLEAR in key->flags - The keyring can be cleared by
>          CAP_SYS_ADMIN.
>     
>      (3) KEY_FLAG_ROOT_CAN_INVAL in key->flags - The key can be invalidated by
>          CAP_SYS_ADMIN.
>     
>      (4) An appropriate auth token being set in cred->request_key_auth that
>          gives a process transient permission to view and instantiate a key.
>          This is used by the kernel to delegate instantiation to userspace.
>     
>     Note that this requires some tweaks to the testsuite as some of the error
>     codes change.
>     
>     Signed-off-by: David Howells <dhowells@redhat.com>
>     Reported-by: Stephen Smalley <stephen.smalley.work@gmail.com>
>     cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>     cc: Paul Moore <paul@paul-moore.com>
>     cc: Stephen Smalley <stephen.smalley.work@gmail.com>
>     cc: Casey Schaufler <casey@schaufler-ca.com>
>     cc: keyrings@vger.kernel.org
>     cc: selinux@vger.kernel.org
>
<snip> ...

> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
> index 8c61d175e195..ac9c93c48097 100644
> --- a/security/smack/smack_lsm.c
> +++ b/security/smack/smack_lsm.c
> @@ -4230,13 +4230,15 @@ static void smack_key_free(struct key *key)
>   * smack_key_permission - Smack access on a key
>   * @key_ref: gets to the object
>   * @cred: the credentials to use
> - * @perm: requested key permissions
> + * @need_perm: requested key permission
>   *
>   * Return 0 if the task has read and write to the object,
>   * an error code otherwise
>   */
>  static int smack_key_permission(key_ref_t key_ref,
> -				const struct cred *cred, unsigned perm)
> +				const struct cred *cred,
> +				enum key_need_perm need_perm,
> +				unsigned int flags)
>  {
>  	struct key *keyp;
>  	struct smk_audit_info ad;
> @@ -4244,12 +4246,6 @@ static int smack_key_permission(key_ref_t key_ref,
>  	int request = 0;
>  	int rc;
>  
> -	/*
> -	 * Validate requested permissions
> -	 */
> -	if (perm & ~KEY_NEED_ALL)
> -		return -EINVAL;
> -
>  	keyp = key_ref_to_ptr(key_ref);
>  	if (keyp == NULL)
>  		return -EINVAL;
> @@ -4265,6 +4261,71 @@ static int smack_key_permission(key_ref_t key_ref,
>  	if (tkp == NULL)
>  		return -EACCES;
>  
> +	/*
> +	 * Validate requested permissions
> +	 */
> +	switch (need_perm) {
> +	case KEY_NEED_ASSUME_AUTHORITY:
> +		return 0;
> +
> +	case KEY_NEED_DESCRIBE:
> +	case KEY_NEED_GET_SECURITY:
> +		request |= MAY_READ;
> +		auth_can_override = true;
> +		break;
> +
> +	case KEY_NEED_CHOWN:
> +	case KEY_NEED_INVALIDATE:
> +	case KEY_NEED_JOIN:
> +	case KEY_NEED_LINK:
> +	case KEY_NEED_KEYRING_ADD:
> +	case KEY_NEED_KEYRING_CLEAR:
> +	case KEY_NEED_KEYRING_DELETE:
> +	case KEY_NEED_REVOKE:
> +	case KEY_NEED_SETPERM:
> +	case KEY_NEED_SET_RESTRICTION:
> +	case KEY_NEED_UPDATE:
> +		request |= MAY_WRITE;
> +		break;
> +
> +	case KEY_NEED_INSTANTIATE:
> +		auth_can_override = true;
> +		break;
> +
> +	case KEY_NEED_READ:
> +	case KEY_NEED_SEARCH:
> +	case KEY_NEED_USE:
> +	case KEY_NEED_WATCH:
> +		request |= MAY_READ;
> +		break;
> +
> +	case KEY_NEED_SET_TIMEOUT:
> +		request |= MAY_WRITE;
> +		auth_can_override = true;
> +		break;
> +
> +	case KEY_NEED_UNLINK:
> +		return 0; /* Mustn't prevent this; KEY_FLAG_KEEP is already
> +			   * dealt with. */
> +
> +	default:
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	/* Just allow the operation if the process has an authorisation token.
> +	 * The presence of the token means that the kernel delegated
> +	 * instantiation of a key to the process - which is problematic if we
> +	 * then say that the process isn't allowed to get the description of
> +	 * the key or actually instantiate it.
> +	 */
> +	if (auth_can_override && cred->request_key_auth) {
> +		struct request_key_auth *rka =
> +			cred->request_key_auth->payload.data[0];
> +		if (rka->target_key == key)
> +			*_perm = 0;
> +	}
> +
>  	if (smack_privileged_cred(CAP_MAC_OVERRIDE, cred))
>  		return 0;
>  
> @@ -4273,10 +4334,6 @@ static int smack_key_permission(key_ref_t key_ref,
>  	ad.a.u.key_struct.key = keyp->serial;
>  	ad.a.u.key_struct.key_desc = keyp->description;
>  #endif
> -	if (perm & (KEY_NEED_READ | KEY_NEED_SEARCH | KEY_NEED_VIEW))
> -		request |= MAY_READ;
> -	if (perm & (KEY_NEED_WRITE | KEY_NEED_LINK | KEY_NEED_SETATTR))
> -		request |= MAY_WRITE;
>  	rc = smk_access(tkp, keyp->security, request, &ad);
>  	rc = smk_bu_note("key access", tkp, keyp->security, request, rc);
>  	return rc;

Better. Thank you.

