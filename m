Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0079F2C778C
	for <lists+keyrings@lfdr.de>; Sun, 29 Nov 2020 05:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgK2EqA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 28 Nov 2020 23:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:35292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgK2EqA (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 28 Nov 2020 23:46:00 -0500
Received: from kernel.org (83-245-197-237.elisa-laajakaista.fi [83.245.197.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7504F20825;
        Sun, 29 Nov 2020 04:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606625119;
        bh=nbFJj2fV+kpvlNtq3rZfFqzGM5D8yeMIYQFiLX2XbOw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KY/YfxdMf+ikQSgAMwa8eutSpAx/Mg0WM8GnmHLi3Wk+u3c7u4VPgTkOPuDCiFA03
         45ZTVm0vyzk1UMWGO7w4L5mJBzl8VG9guPIeXmtLKAWN/ZHtO6HAVM/xbyzi7AQL0P
         hn1tJTrd/lHAnlEnqhW58eVwO1qQ8GJLzFsk8djs=
Date:   Sun, 29 Nov 2020 06:45:14 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     trix@redhat.com
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: remove trailing semicolon in macro definition
Message-ID: <20201129044514.GH39488@kernel.org>
References: <20201127191543.2854306-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127191543.2854306-1-trix@redhat.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 27, 2020 at 11:15:43AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> The macro use will already have a semicolon.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

I'm in-between whether this is worth of merging. The commit message
does not help with that decision too much.

/Jarkko
