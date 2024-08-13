Return-Path: <keyrings+bounces-1871-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE695025A
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 12:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A040FB23B4A
	for <lists+keyrings@lfdr.de>; Tue, 13 Aug 2024 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C521189BB1;
	Tue, 13 Aug 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="YAjdNAGp";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FnmmqpRH"
X-Original-To: keyrings@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1145B17C228;
	Tue, 13 Aug 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544618; cv=pass; b=BD5hApHoN+3E3hBIGIPPWHeUVgfEM4Ro7xov9Qom2oUE9hHLDboH94oK6EsgUpP+FpNvaNElDIT21ur+jjMTmVQJWruzbvTdvOdjy4g9hrtvraeNStyWzPyEigqrS9OCkmYcnSGrJLeQliKB58+1yTmwmINOsIcBPaCdx48NR7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544618; c=relaxed/simple;
	bh=yNnR3JNgL24+GniR04GS/+TvPRzO1SJUZmEkdjQahfw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nv8IgIAi32vLSym/J3Rq9Xvghj0g9Z5IXHueFJCGx1RSPeSTHyvLpgYvI82yxx2hbz53t1J/XsYQqVyMXX3gXtN8hnnoi1WoIGg9XXc8AXi+lPIQddnroXn5Gvocp7C/mJQ06urdOf1dAJEuG5igjKhvlri3JtWbHA91NqXXBrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=YAjdNAGp; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FnmmqpRH; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4WjnXZ0v80z49Pv3;
	Tue, 13 Aug 2024 13:23:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1723544606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNnR3JNgL24+GniR04GS/+TvPRzO1SJUZmEkdjQahfw=;
	b=YAjdNAGpE7A6dwPItlQskvqsgo/7VVMKA/sjcqZ4nU0WjyA5cI/T0hMeCxmFYSF9PFkDP9
	nqQlBAKck5bp7j8zvPNdMPAjF4stAuqnOdGuwuT+dLoxjAjTnbn3gnmNtyhu9trrgWXPWl
	NTt7tOCSorYC9QqbUSVUV0/RtSVqubAy63773c8btU2sAplmLpcYVhcorDoRujn7Jlheub
	/UV+x3AcvW1t0I25pKk1/yuWtbcDlXHFGIbOZZlEo6ojYd8A1KWm+RXVpozF7exzmh9Xyl
	UNL/IYzQeQj+dQBcjc0zyHiuqnyTCaoNTBh55Jyc37CF7uWwMvG8AfbXZ/aR/A==
Received: from localhost (83-245-197-106.elisa-laajakaista.fi [83.245.197.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WjnXL5cL6zyV8;
	Tue, 13 Aug 2024 13:23:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1723544597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNnR3JNgL24+GniR04GS/+TvPRzO1SJUZmEkdjQahfw=;
	b=FnmmqpRHcOoGxnDGnoB1PDh1iCCtenX53NvOC/A4VrNlKpEis4dYJxmU9cgG9Iylzqc+Mc
	JII5rCSphSYLOJpf3RkOY8DvE7pvgykpMn0T6jFPOBOdybbG0VsO1/RdVQevJ14fYhVyZX
	+gK1N3rMtOgQU2FsCJeAL/QIdzfUmMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1723544597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNnR3JNgL24+GniR04GS/+TvPRzO1SJUZmEkdjQahfw=;
	b=Rzujk1h2BWttlsTCOZAjOSiBo5hkJWuGKFSMWzSrh+f2/Zq3UHOaWRtsQC1MiTU00c972j
	PnQRxnZkOqpel8ls4uJLa+V1U0hPjOwoaNLOqqQXY+FsDi/Oc0MfuZlUgOSpE1A5f5L/2V
	PZbNXWZZuIV6u6gUpIWEkjME2AqzwvE=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1723544597; a=rsa-sha256; cv=none;
	b=x8/pvvpCk0fek6pYspCjq0ibwnig63N5dwnX3gjkpJ/nJfuCcv8OpYFqQgpyLhyIbfy0AR
	ouLUraOTtMDYN7cXSiQcJuU6OQH8KI/4+k2UpM4QxwexWOR5iJ3S7/PnVkSQLWRIh+uusA
	adqD8zadJ9OhbVuzC5IORYCjdT//WZw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
Message-ID: <900fcce8cdce254e73864c653743370108fd0555.camel@iki.fi>
Subject: Re: [PATCH 3/3] sign-file,extract-cert: use pkcs11 provider for
 OPENSSL MAJOR >= 3
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Jan Stancek <jstancek@redhat.com>, dhowells@redhat.com,
 dwmw2@infradead.org,  zxu@redhat.com, keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Tue, 13 Aug 2024 13:23:13 +0300
In-Reply-To: <10c0539a6103f4da2eb19765c83800594ebe2dff.1720728319.git.jstancek@redhat.com>
References: <cover.1720728319.git.jstancek@redhat.com>
	 <10c0539a6103f4da2eb19765c83800594ebe2dff.1720728319.git.jstancek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-07-12 at 09:11 +0200, Jan Stancek wrote:
> ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> Distros have started dropping support from headers and in future
> it will likely disappear also from library.
>=20
> It has been superseded by the PROVIDER API, so use it instead
> for OPENSSL MAJOR >=3D 3.
>=20
> [1] https://github.com/openssl/openssl/blob/master/README-ENGINES.md
>=20
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I think all these somewhat "dead obvious" patches. Not much to comment
on these.

BR, Jarkko

