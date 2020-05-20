Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDD81DC02C
	for <lists+keyrings@lfdr.de>; Wed, 20 May 2020 22:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgETUcH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 May 2020 16:32:07 -0400
Received: from sonic305-22.consmr.mail.ne1.yahoo.com ([66.163.185.148]:45297
        "EHLO sonic305-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726860AbgETUcH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 May 2020 16:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590006726; bh=6mffK3RH01pMSJbI3gzRyn/TJ4jPuu2pqeTpPbg3ras=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Jh1GZ/zp1JqyVWAoqfhtOBi201up2S1j+vj+cvRRjI/wF6dKLZpH7WHDjG3tu+29xjAbHc+PmIg5aAiqs0SWTOq0WfWJx0HFJqbDSEXKkqC0WhfGv8vEoLZnS08JfDwGwvixc2CaUY0MdeKOHQV3Rq/ddhdHj3ktfv/5c/CSPZfWXYdY6laJmfxaXinLvHN+QVyg61MjgZLz2tAtAzSRYdxPQtY7McKv0kiJ9Bk8igJHVdYW8cqDLZbfV0YNzOTt/RTXR9qWbEx02BiM/Yg4TdLnufWxJzAElxqJk53boVzEjql8YAZ4m0NbLgdyhl12MweFAptajCToNhbgeJNHgQ==
X-YMail-OSG: Xfh9dnoVM1kthxtruSoQ9S6dUoFvkRZQDKi2_LTWKnB3pXut6EmMqhGxa2Mzc0J
 ZPJ9M1aRrFZxqUsmYbdSElgBTh50YFt1ypHDzPGyQ.brAnrFofjSoUvI4DXMTg0_VTpkSV5yzI_X
 Ls8kd_E1KHUHE9ffBS6Do70Kh9TwhIdCBKquvb6loabOPxrZMSMqd0.XLAKAgwYwMdQoKpqV_j7F
 yiEsCBnGdIDQPIE_cT4GBZ3EAVm95SQSJITV4HhuAEQm9D8u62fuTIWOUU1jdsIKY_SB_P4CFjpx
 Wg4.qqbyHSdvhSWxiOup0nQLOhGWYAcLx7N5VjDzq6634zFp.LW8j3Jhhz1khmpFkZPOtmgEXgmV
 JwO0ZnnkFs5BGxA5pdNEkyxDhPLy2mczZ8xY_agU1g6FOLi7EDVGUDOYFrECc6Om3rzsnTgQWG0B
 GuEhyJgIe.yGrKp0O5zUzOEeBHzbaQA7s1mx.sDZhJGggmvvSHtttP.G8SFeuE0sDoD5yyF43dkV
 fOdZrwXZB0oG50uIz4.qxHEOJfMCv9MGXbE6TdkYJ6_mhomfNcx4_naB6rCk64G7yCY1serRctqx
 RXJX_phLkzt7bfwzw5fD_SL2kabWb0FnKKSCthUKqUpT5Zc2ZSnCfrOJ1hruUqNaQrFzzR_SupoU
 iWOvF9WZdcP86QKYJDRQM_sVybSZul1oTypvB6L.7blzXZHgDHdXkV7P8fWEFw6tKqVOI1oAknB9
 QaL_YSvukP6UpRQDgti58jlgx6WDST6SSVWJBu0aIn.uMTORzu4ca.FIMHwVRB5Gh3g1PQPz6f62
 4Lk0ljO8ot95sgi3.GzL.E8lhq5b4gp7BJI6XVrYWjFYtX_ZyWVFgBd_YfzuT13meRwx8UruIcbZ
 thFcW_y0LEfjvBRXvO9KtKxKUO21xHwKI2qH_NhnDdXRfkJrse4yPCkLDUtknY.F43bwtSrcuBKP
 jim4LnyKk8jTcwroN4i9M4u_QiIYUiX.CqHSyHoxaUYRevrO52K.1k7G.c1rw4dLpXBOkr6RYdgs
 q2M7tbfL_FAYN2prXPtGsvKx2wqtnwXXVP3BYddY.QzmfxMRNp1N9X.wTmHsTjb312AdKTLPWTkJ
 3B8tgCwnCFzjeAE_6mp45fBxDnDxs0N2OKvyr1FBAGpHKjr7izdiRqeJQrph1ZjdT66bD1kOvoUM
 DHKBqR4difYryN014p91SlYktU1yw4DxxLc5F8HNiH4ylM9CQVKXDzmKOTWVgUZZrBDyTsnlA2Rm
 SmedC1QT27tfr_qdGjIqeCSNilggjiLJkKhUJQJNXQN8mJzRrTIIxyEKdVPZJ4qCwidaMLSuAAyr
 xoQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Wed, 20 May 2020 20:32:06 +0000
Date:   Wed, 20 May 2020 20:32:04 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1020918044.69477.1590006724038@mail.yahoo.com>
Subject: Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1020918044.69477.1590006724038.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15959 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? i was born and raised in london in United Kingdom Take care Rose.
