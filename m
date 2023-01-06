Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCA76608C8
	for <lists+keyrings@lfdr.de>; Fri,  6 Jan 2023 22:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236697AbjAFVVt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 6 Jan 2023 16:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbjAFVVD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 6 Jan 2023 16:21:03 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF91872A7
        for <keyrings@vger.kernel.org>; Fri,  6 Jan 2023 13:20:27 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 7so2008899pga.1
        for <keyrings@vger.kernel.org>; Fri, 06 Jan 2023 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D735tsLCLRgwW3YDOAiPa/WNPif3+zSkF8bjSdhwvpU=;
        b=LCpXDGuAzkW6sAhl68OaEbDsXqglF6dU/jW/kfKBzhHs+z1qhbx2IEp58dm/R1oBrX
         UiQjvIqDD6EnIF3WQXUqc/MAlDD5VHHdo65X6GQVp1xZbjUy1WN5QYHpPpnhDYV+R2ss
         0pBmHYifxggc1sm7qYLxBvPfqyHnMLdTV0MtUM6hbXcYyFfk35bDyoZ/97bYaK+NsyZO
         Zh1JFd/wSIlDzliZkD/7fmJPLjCiPe9m5rd12pkBjc5eQkmy/+LEtOQSG6eLYU0gl/m7
         G5DrMTOLLTuGVHXBOz8r9FKjLE1tHHQlQvs9nkuxpXNMUYtGpkpQ3UPdApPYcJcqMrOW
         XCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D735tsLCLRgwW3YDOAiPa/WNPif3+zSkF8bjSdhwvpU=;
        b=W5+txadysysYk4ovcymeFioSqY4MVaHf5t/5EUdnsv12pTh99BM+HC8YTUKdc1k2oh
         sgziVRReIfWW5LLY9Vxl8Kd/Z8ZLr57jaGqpIkAxuTKuCg5lAY816GgKLRJ9E9VmofSX
         HFayp+reFRbgCOJIYiJJcyrV6XRBIJnHp5AjH+yfjUwz2N+6a4VOTfXqYDTdhln2zQzd
         JRAJCvK7I4fNtvknZr9z2NMBX4D//z9X8vpRBnq7DQjiPM/WGITJckCOGj9ohSqplfmZ
         0aXjlUp+3OWSjQd+9Kwo+oiiLy62WB+bHrJv2Avoe5TnT+vzv/Fmq6kHdbdmV3s1Pqa8
         JDFw==
X-Gm-Message-State: AFqh2krXJrO4ePuCJ/ahB1o/T/H3JWb3NBaR9OqT3EaZGRnrIJPcORX8
        7h6WSUOGQo95CsHy1tYNST5WQd2bmn/9aOc2eGib
X-Google-Smtp-Source: AMrXdXtBMlS9ssXipRSFnItDt9FgTwfSPmT0zlLXAUJLFwl6FtCHAqOxyXkHSoqChwk5HYucgzsgf7dZo879AqIAl3g=
X-Received: by 2002:a63:4e5d:0:b0:478:42f:5a3d with SMTP id
 o29-20020a634e5d000000b00478042f5a3dmr3486392pgl.3.1673040027275; Fri, 06 Jan
 2023 13:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20230102204537.4842-1-rdunlap@infradead.org>
In-Reply-To: <20230102204537.4842-1-rdunlap@infradead.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 6 Jan 2023 16:20:16 -0500
Message-ID: <CAHC9VhTCm36EO0TH1bHO92WSChmWaCzW_uvDaLLg04=UDv5Rqw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: trusted: tpm2: use correct function name in kernel-doc
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-security-module@vger.kernel.org,
        James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Jan 2, 2023 at 3:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Correct the function name in the kernel-doc notation to prevent
> a kernel-doc warning:
>
> security/keys/trusted-keys/trusted_tpm2.c:203: warning: expecting prototype for tpm_buf_append_auth(). Prototype was for tpm2_buf_append_auth() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: linux-integrity@vger.kernel.org
> Cc: keyrings@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> ---
>  security/keys/trusted-keys/trusted_tpm2.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Paul Moore <paul@paul-moore.com>

> diff -- a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
> --- a/security/keys/trusted-keys/trusted_tpm2.c
> +++ b/security/keys/trusted-keys/trusted_tpm2.c
> @@ -186,7 +186,7 @@ int tpm2_key_priv(void *context, size_t
>  }
>
>  /**
> - * tpm_buf_append_auth() - append TPMS_AUTH_COMMAND to the buffer.
> + * tpm2_buf_append_auth() - append TPMS_AUTH_COMMAND to the buffer.
>   *
>   * @buf: an allocated tpm_buf instance
>   * @session_handle: session handle

-- 
paul-moore.com
