Return-Path: <keyrings+bounces-2213-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AD9A1781
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2024 03:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A20B1F218B7
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2024 01:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7888114A91;
	Thu, 17 Oct 2024 01:19:51 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FB18EB1;
	Thu, 17 Oct 2024 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729127991; cv=none; b=k+rMKXNB/DTrvkxRxPBomIbpVnbSeTIlYhpZKWVKNSnFnlSrAlS7E1XP2A1Jw8Sry8Fl8I4lo0xZaX/1a2/shkiKURSPrR8p+ln3b6iqUj9JfNCGw1wBM9aCvE5RuIXF1QKhF+SLgjITUcyeqROWHDJis9lrGwYk+jBmyB5Nenw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729127991; c=relaxed/simple;
	bh=xkQXcGeEip0mfY+HeD7Gg9eKL72EhGvjkBtql+9Z+Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQuJLvJTZ1VA2nRKczZqlOz5iotczJ9qgOZIUTwBipadkIAo/IB9RB8Fo4X3LLPf8PtdZ94JRJm909nb5NzoK0LJgoKtieS37YEloVg7ot9pB6PXbp3OFXggwbjdy6vTwv++Ro9ImUR/KowucARAPQ9U/YlL8QolNIVYefbOPus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XTVNz1fh0z4f3jkM;
	Thu, 17 Oct 2024 09:19:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 4B2A91A018D;
	Thu, 17 Oct 2024 09:19:43 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgB3zIgsZhBnaeqqEA--.57703S2;
	Thu, 17 Oct 2024 09:19:41 +0800 (CST)
Message-ID: <912228e4-ca24-4ff1-9b18-af314b53835a@huaweicloud.com>
Date: Thu, 17 Oct 2024 09:19:39 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] security/keys: fix slab-out-of-bounds in
 key_task_permission
To: Jarkko Sakkinen <jarkko@kernel.org>, dhowells@redhat.com,
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc: keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241008124639.70000-1-chenridong@huaweicloud.com>
 <d3fb6263-b1f3-4bcd-b28e-abd81fbbd711@huaweicloud.com>
 <021c2dffc7ced6030213a9cfa7939a34193a3cd4.camel@kernel.org>
 <fe310437ce19ed5aa17f5c37d010c88d1ef84a14.camel@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <fe310437ce19ed5aa17f5c37d010c88d1ef84a14.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgB3zIgsZhBnaeqqEA--.57703S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYU7kC6x804xWl14x267AKxVW8JVW5JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7
	xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAq
	zxv26xkF7I0En4kS14v26r126r1DMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrR6zUU
	UUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/10/16 13:14, Jarkko Sakkinen wrote:
> On Wed, 2024-10-16 at 08:08 +0300, Jarkko Sakkinen wrote:
>>> Friendly ping.
>>
>> Thanks for pinging because I actually accidentally missed the
>> original
>> email!
>>
>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>>
>> I'll pick this up.
> 
> I tuned the commit message just a bit (see my comment
> embedded):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=9bb3ba75c1c8fd8c9f6a0b1fd6409b725583a3e0
> 
> BR, Jarkko

Thanks you very much.

Best regards,
Ridong


