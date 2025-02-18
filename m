Return-Path: <keyrings+bounces-2410-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36653A39E10
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF59D7A1AAF
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 13:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D80263F36;
	Tue, 18 Feb 2025 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="XZZv/R4l"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1144262D1C
	for <keyrings@vger.kernel.org>; Tue, 18 Feb 2025 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.184.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887006; cv=none; b=BjLBdr8q3yA+8reOqsuMR3FpoLi0Tao2p3ONjUi7I3aMgbjnXRF76hhMVu1LE3KrjAbctzC7bzEtHC2M+qf8negikXC/xvMnIa4KS+b2zb8AA1O1AVf0DJt5VZ/kCUWrxbHCiD+s7YISOtiexux0MENShJVPd6rwCqTtyUDZpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887006; c=relaxed/simple;
	bh=fb06lK6CLp7c28foYzIWIhFnMtzyRZPnOkaAS03tApw=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BsOcPuD7BwESbaIviu8vQwTPGMgvGwwHSvnK/Xh/RMPpD6j9Ew1S2ufiPlv6dFCIKTJaMTDizByINUq3AtKiuCJf1bsRFSeFHQ2VpVnShahuoj7vha1PUeLJcBH6L0QsOObtww5D8PVjBKx7PQLFfHshr/ZoEQOCWY+cxZrBaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=XZZv/R4l; arc=none smtp.client-ip=207.171.184.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1739887005; x=1771423005;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=fb06lK6CLp7c28foYzIWIhFnMtzyRZPnOkaAS03tApw=;
  b=XZZv/R4l60mB9LcCcvjsS0brYZZ2XFAGzql3YVvNw9CKPQrOmMlOXnpg
   Q9Oy7WQXRb5q0B3FNgH03o+sub0K4RS7ogAR2LPPP2VjkC/BEwvpwR6g5
   J7gD0bXihB7WuEIGRqbMNEiviNlVebp4IFs5Zpp4v2wLH0phcOBQxDQkJ
   8=;
X-IronPort-AV: E=Sophos;i="6.13,296,1732579200"; 
   d="scan'208";a="494883355"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:56:40 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:58011]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.150:2525] with esmtp (Farcaster)
 id fa17408b-4a6f-4b47-9e1a-931357345d77; Tue, 18 Feb 2025 13:56:39 +0000 (UTC)
X-Farcaster-Flow-ID: fa17408b-4a6f-4b47-9e1a-931357345d77
Received: from EX19D021UWA002.ant.amazon.com (10.13.139.48) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 18 Feb 2025 13:56:38 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D021UWA002.ant.amazon.com (10.13.139.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 18 Feb 2025 13:56:38 +0000
Received: from email-imr-corp-prod-pdx-all-2c-619df93b.us-west-2.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Tue, 18 Feb 2025 13:56:37 +0000
Received: from dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com [172.19.91.144])
	by email-imr-corp-prod-pdx-all-2c-619df93b.us-west-2.amazon.com (Postfix) with ESMTP id 3D76943B7F;
	Tue, 18 Feb 2025 13:56:37 +0000 (UTC)
Received: by dev-dsk-ptyadav-1c-43206220.eu-west-1.amazon.com (Postfix, from userid 23027615)
	id C5E414EF3; Tue, 18 Feb 2025 13:56:36 +0000 (UTC)
From: Pratyush Yadav <ptyadav@amazon.de>
To: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
CC: <dhowells@redhat.com>, <keyrings@vger.kernel.org>, <benh@amazon.com>,
	Pratyush Yadav <ptyadav@amazon.com>
Subject: Re: [PATCH v2 1/1] Pass "err" argument by address to "_nsError"
 function
In-Reply-To: <20250218132711.34346-1-abuehaze@amazon.com> (Hazem Mohamed
	Abuelfotoh's message of "Tue, 18 Feb 2025 13:27:11 +0000")
References: <20250218132711.34346-1-abuehaze@amazon.com>
Date: Tue, 18 Feb 2025 13:56:36 +0000
Message-ID: <mafs0tt8rl5kb.fsf@amazon.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18 2025, Hazem Mohamed Abuelfotoh wrote:

> Commit 0d71523ab584 (=E2=80=9CDNS: Support AFS SRV records and
> cell db config files=E2=80=9D) has refactored the "nsError" function
> by moving some of error handling to "_nsError" function
> however we are passing the "err" argument to "_nsError"
> by value not by address which is wrong as that basically
> waste any processing we do in the "_nsError" function
> so correcting that by passing "err" by address.
>
> Reported-by: Pratyush Yadav <ptyadav@amazon.com>
> Signed-off-by: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>

Acked-by: Pratyush Yadav <ptyadav@amazon.de>

--=20
Regards,
Pratyush Yadav

