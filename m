Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A9C70C890
	for <lists+keyrings@lfdr.de>; Mon, 22 May 2023 21:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbjEVTkI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 May 2023 15:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235128AbjEVTjy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 May 2023 15:39:54 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D68E0
        for <keyrings@vger.kernel.org>; Mon, 22 May 2023 12:39:49 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-25372604818so3032312a91.2
        for <keyrings@vger.kernel.org>; Mon, 22 May 2023 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684784388; x=1687376388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfaqv2IW7j0ktP6l11yDGjlEMAVbqVfA7CnllaEK2Rs=;
        b=ZRoUXeZmwyWzkn0eXCQdTEgaG/5JOaNMWRu5CALSkJ2ClASO5oVeRcfc/Pw0ZgbzhK
         WgB6Lbi/XaCPOj+u0LOVQe+qc7i+tOCIlZE+G7tWpKqScZSS05qgEIUyNiFmaqQdbmhq
         NdWRXcpcjuevxIjne0Fad+6PDzEmk3PG9QeKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684784388; x=1687376388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfaqv2IW7j0ktP6l11yDGjlEMAVbqVfA7CnllaEK2Rs=;
        b=eyTevwUaRDEZemU8H/slTXltsV5gL/KdH7T3+iKfExDSOK0iVs90XAZ2h9/wOZwKBi
         o7gDnvLhy+Bki6giyUl6UR27kkgNTQG/2xnrM2lAZ/K8Rbcqnn523kiwVtSt9veTeLB2
         adr1Qd+NHAsme855kkdXEcXD2X8eB7hRvM9VpJLuxAvGmiDpydSIGzhVZ+QiQzF9h1Bj
         NAesdcTnf/8P38cSHAe+SJkZdGcsdf9CJnDpJHSFvwJDmj4NKLrkn3js92tYwZBHoIkg
         xv3F3bING1IW0psk+HPdZupxjP5QaVjOx6ygL+N1tSAXeGEVJECJ3Xxnb3MXYNScZXa2
         GGpA==
X-Gm-Message-State: AC+VfDxYD4HpcAbJ1C+lsCUobbKZQMabOm2SZL3qpbWUXssR80CKuR/w
        nS5jXUtzkF0LOg1EYkiTbMhFgAli+t7yFqb9sVA=
X-Google-Smtp-Source: ACHHUZ4NYfF3iCEwTe4ycC+JoW8VPmMThArz1vR1M1V4rL/Npj8HuuJy+7FLa0RBPTgwstI9ecayWA==
X-Received: by 2002:a17:90a:ea94:b0:255:2dfc:6c6f with SMTP id h20-20020a17090aea9400b002552dfc6c6fmr8179344pjz.24.1684784388625;
        Mon, 22 May 2023 12:39:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bf7-20020a17090b0b0700b00250bf8495b3sm6191495pjb.39.2023.05.22.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:39:47 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     dhowells@redhat.com, jarkko@kernel.org, azeemshaikh38@gmail.com
Cc:     Kees Cook <keescook@chromium.org>, serge@hallyn.com,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, jmorris@namei.org,
        linux-hardening@vger.kernel.org, paul@paul-moore.com
Subject: Re: [PATCH] KEYS: Replace all non-returning strlcpy with strscpy
Date:   Mon, 22 May 2023 12:39:35 -0700
Message-Id: <168478437622.244538.16496528769625155302.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518041513.1669386-1-azeemshaikh38@gmail.com>
References: <20230518041513.1669386-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 18 May 2023 04:15:13 +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> No return values were used, so direct replacement is safe.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] KEYS: Replace all non-returning strlcpy with strscpy
      https://git.kernel.org/kees/c/8d27fcac4a08

-- 
Kees Cook

