Return-Path: <keyrings+bounces-2301-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CC9CFF70
	for <lists+keyrings@lfdr.de>; Sat, 16 Nov 2024 16:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06821F21F12
	for <lists+keyrings@lfdr.de>; Sat, 16 Nov 2024 15:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EB31078F;
	Sat, 16 Nov 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc3K9IMo"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8191D529
	for <keyrings@vger.kernel.org>; Sat, 16 Nov 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731770327; cv=none; b=bGiTWm3SvSCbWPmiy2WKPzSn26VBeYpTbo4D3rUW6YqkxyEbhUsa3qAwPBXjJUPApFlHX+Nx8uAZ4PeXj/A/miPIdq6c8HkpH8RCV1stmJ3SxUaTOdly1/9KRoMHA9Ee2LV9K4Z2icOnjNyMISGfC/jfylvFHqodCK3Nj/6UHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731770327; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=YaIHF3MqyVI/pI2+Rq5BCLtLJErs+LQPJkQHrpZcZ4m6r24femzghoV5jnNUNL9MSCdE0rA5w1tnSqODPTuUxn2oRsC+SxGPqYa/eAjI1oqFvMMLRk0XYJ4V7SLsYJSC+iWVoaSoRQvR/fKUJdaVcUggdW0g0WGyiKr2Vv/XiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc3K9IMo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cdb889222so16208955ad.3
        for <keyrings@vger.kernel.org>; Sat, 16 Nov 2024 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731770325; x=1732375125; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=Gc3K9IMoJuJI2TeJ6NTCQIXP0sx8fPNJRZZYW7mmpeENJMe2J4Sxkrjbwld6H2BZun
         dAClwfCrQdWaMwERuctp+ZGL1ZdNJiBQCGG1v89QpZK9FewEKVFlDR7OIkcaLuxxYCFD
         svXwNFgUl+9LprJb0lgQBIhSBEVmMTEeMDhg5YISPIH7NQIOoL/kYFdfXFsHImpTD4Sj
         PKig6JXSdJIOEu2itKv02dFORAls6zDDpitjSGaZOoza9YQnTLXE1wEjkLfdJhUxR2V6
         w+3dbMS35P65DHc2g7tQzrvtY1rkd/6bou636u4XwKlAlENJvoO97fTU+N+EiDvFM5/N
         0qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731770325; x=1732375125;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=OIoY5VNJ2BHcc4vmOuGxXpKQEMyzXXAN0dS1LpV827L/mk3u/UwNL7xdQCAsdsNlCr
         /Ka/XgrbMWyFZ8mrgUeeQcBD06BrqsB1yYZ7/X1ALX/0jtmI9gDScZuQOGHyHcjPOAtY
         ZuvcAvXffFBoGGasczDLphEPTPz2qP3pmeS6ruaYF6Q5iIuPLrH4MAS9rVBxNOwuvpSe
         UfSQd1BPn/RovWu27GWwK+eIGYsYLp8WMXBFkJWUs913epHWhs6XHQl6v8wUb7ujcYbW
         CJXfA5a8pnkB5rPpRdusbypR0/Oie3U2bJzW8dv+spcIVrZv+cbnqNw9t0VKsLBKATCT
         IrIw==
X-Gm-Message-State: AOJu0Yw8szTA296Cv/AZiHTIkhjl1gNnQGKoOUo5jqGDdy+YoBjBi1qE
	K6h+EXwmqa25Nu8EmN/eR7wkebBMV8+MGxj+tnCQYOa9yeZ+pogUk0w8
X-Google-Smtp-Source: AGHT+IFiulUNhLWn3UhgMDRk3N3PQiYliboH+pU0vfbbkQIKTFBKrtAjzocxmUh033y/lzZZMAXHrg==
X-Received: by 2002:a17:903:11c9:b0:20b:5645:d860 with SMTP id d9443c01a7336-211d0ecc3f0mr90830525ad.36.1731770324966;
        Sat, 16 Nov 2024 07:18:44 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f54d4fsm28902685ad.229.2024.11.16.07.18.43
        for <keyrings@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:18:44 -0800 (PST)
From: "Van. HR" <jeanpierceyfdvx7548@gmail.com>
X-Google-Original-From: "Van. HR" <info@information.com>
Message-ID: <d957b18c1e93476ff5fb4ff8a7b357e7f1bca410f4af8ac60971e749cc391808@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: keyrings@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:18:42 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


