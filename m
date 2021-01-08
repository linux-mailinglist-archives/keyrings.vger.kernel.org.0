Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629742EF59F
	for <lists+keyrings@lfdr.de>; Fri,  8 Jan 2021 17:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbhAHQRc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 8 Jan 2021 11:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbhAHQRc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 8 Jan 2021 11:17:32 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5F0C061381
        for <keyrings@vger.kernel.org>; Fri,  8 Jan 2021 08:16:51 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id v126so8835347qkd.11
        for <keyrings@vger.kernel.org>; Fri, 08 Jan 2021 08:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=QI+UMpDk1q6lkqlYTPvjwHMFas4jk2bj+zkOo6jpO7zyzVqDFS8juIsp/NdwriJbJh
         B6KT9p4VKr//PcDizrl9v5NtvpIiZ6ZkixqurvaWXEzSy69kULV6lJiw0B8ansWrU5T4
         Yhs5GzvEkvch5oCTfwaHQ5zK3ZCjvxPPpd/jX9UicO/7TieCFobiw+gDPw3QfpKUpByx
         38NWGhRSAnrKvBUC/ubArFJ9gIeuQ8tcIUYio5ptHJA9a7fmgotNm8GNFr8YSyOJO5Zh
         cUz+TKenKwIN/si5RmsMRGxrf34V1q4BW4j0MlZ1kdXuB84yxBD18Y3lP4Tr2RJQ/D6o
         otEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=Bcnyu/5Ep3Ru04Sb6opdPpWmHVUJzA6RmEA9rBCxTiiTOC7JsoHB/E9be3brsHbN6k
         RbsjK44gPmsLmYbEmQ+oCCXmxuvd8ndgN/HV73EAzy7EH/BGMs6xFljYHkTrOvBYMd12
         SCOZqPv6WRFvp/a1HTnxmFT0jl5aLHOkysS2MiytxznwNn4897I8Vsop5RolUQbxc36g
         NxRx6rGJcz7V72Azihz6HuPqKFv/ZjUm8hMpBPE8R9XqH5kvsn5nc6Jq0kAa+BJ76gkJ
         59Po6OhgwNy6kJ+wotsMupzXiK0YhDvfunWiUaiAwYbCytffYl7yL+g1HQZN3/YCR5Yy
         IVig==
X-Gm-Message-State: AOAM532HJhKCdVNomZga96rl/tABNo7NhezqbrXylYSWVNVQyNxbHJ/e
        rocyQk6lKS84hsqBzQEvT20xhHDONVROGs0tfSw=
X-Google-Smtp-Source: ABdhPJy4hyNFH/SYGcLnTu3ncVwfhOJKF3AiKZoRB2F9zw2RMY8nFzyNdWj1skdGEfJNlsOfZTxd1w8tiueOQQwZ0O4=
X-Received: by 2002:a37:a8a:: with SMTP id 132mr4531751qkk.327.1610122611232;
 Fri, 08 Jan 2021 08:16:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:148d:0:0:0:0 with HTTP; Fri, 8 Jan 2021 08:16:50
 -0800 (PST)
Reply-To: camillejackson021@gmail.com
In-Reply-To: <CAGCmbMQupVT-1ZX2--N7Bjf2eW4VuUQ4dE_hzd1qAGQuE_JBEQ@mail.gmail.com>
References: <CAGCmbMQupVT-1ZX2--N7Bjf2eW4VuUQ4dE_hzd1qAGQuE_JBEQ@mail.gmail.com>
From:   camille jackson <adamraouf78@gmail.com>
Date:   Fri, 8 Jan 2021 16:16:50 +0000
Message-ID: <CAGCmbMRyqpxC22FGuUwP6b3qrZb0FeXUiZo0kc9qNHvzw1UkYg@mail.gmail.com>
Subject: =?UTF-8?B?0JfQtNGA0LDQstGB0YLQstGD0LnRgtC1LA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

0J/RgNC40LLQtdGC0YHRgtCy0YPRjiDRgtC10LHRjywg0LzQvtC5INC00YDRg9CzLCDQvdCw0LTQ
tdGO0YHRjCwg0YLRiyDQsiDQv9C+0YDRj9C00LrQtSwg0L/QvtC20LDQu9GD0LnRgdGC0LAsINC+
0YLQstC10YLRjCDQvNC90LUNCtCx0LvQsNCz0L7QtNCw0YDRjywNCg==
