Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC34150541
	for <lists+keyrings@lfdr.de>; Mon,  3 Feb 2020 12:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgBCL2F (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Feb 2020 06:28:05 -0500
Received: from sonic306-1.consmr.mail.bf2.yahoo.com ([74.6.132.40]:41042 "EHLO
        sonic306-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727240AbgBCL2F (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Feb 2020 06:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1580729282; bh=E+ks7AydzaUb4ISZTuxin7s0E6gVmk5020fTLYVYB5E=; h=Date:From:Reply-To:Subject:References:From:Subject; b=aGoOr+nMTxpBSuZfY9c9p8f0oFAl6GBBMLGggeF0fCVpwpZmT9TZCjvQTkiab4gSPpPSC8pKKOxPHALSLArSWuBB8B3NB4eODmXihJAfAUvGCVbg2PoiSTjqlWPS1bnEPTZL9PWHVek567a6byaVg3ClD4UOMO6T/kZ9YF1KkR9Q/3g1pK53iSZZXjriNaNECRZE57QzJSk0Ph4N4tSLASUUuM5eqo+TcWM3TnaPbDaMe+v3XYrjcSPASCJr2XoDaDYnfH9QOSyOwqIlkhztBs+XWWHm7LfoHFhHlxE5C4mbBANWtbTvUR3GLYSm95uflaGHOTvdB13JcyOlpY/WBA==
X-YMail-OSG: yz6n_tkVM1kWr.uWm1IuESSvdUZQpmk0t5zMhwLq1yR2yjZOHvQzlwVTyC_ixJi
 ywEIMSfZRMpP7dLQFbRjsyADX4Lmizf9iz.JW5Pm.RIGuG7pt_Nxbdr.CeD6qHQKlEIY4c9NGUvy
 IzwbeR1pXT.FQHj.JEwgo7H22fQMoHIpa_9voJ8xL_nkmzzCbQFXlt0lsTSk4yaLFwGZeP3lz_5X
 uB2ADLNhq51Ta3o0IapUs37ggU3RnPqOJUpxVmomeSyi2nnYtOxUvhbXUVAhMoWm7zHDttt_iDMA
 c3TmSNZN_XHxgFtV2kySrvVjKqVnyzB.Emj2Nu5cNhDipnIdz4nrVHSu.VI_Zn7QPuGlNzuBdSzz
 eSG8QcEGAIq7sOFvXmBcH53jr18Cv6e1lnim6Cq9t_GlLL9vHoPQgDFABRZW4LAQa2qLZ2Pc.M8m
 92ojK5r.WpxQUfVKpfjITGHapGKqrAJeZ9gfCMO0IwtyhhNA_BKRKgwPH5Azq8GSGtlshnmGAtF8
 ezkpVhdyQT.ub1Vun2ZnyqY_ptGLBM0s.QBw2i6GyEy0sT5MdtFwz1cjcdNgwpGCxbGuggXV47pF
 J3xG1Zj8qzXzm1VG1gvrS08mrRj8gNo6PRwRdYYpXsJ_vcrCDk7WqPZu9.7jVrouROhepc6Taifn
 e.e_w7saUuKIkX45GMVjB1_QaS2Ktu_7.majTBW1vXmchmjrrdf1W.BjOY0x_FlKnOFzswH8NKZn
 erxipLz7nOYLiL2qTgv8CF7HWlvQEo8UFoPX7955O1XOlWrSDSHfvGDWFUPA6_F3yS8pq6.FNcA_
 xLFzYF3MOO477nm1jT2uteWvRhhesqAQ56Ox9L8oPpN921uzwznV3CdbwKEzjEZQqCVUvUv2VPFD
 E.wcw.KickrbwNfHuEv6egVsmCnZpO42UdV5G4Fn2Rtn9sM6n6iB9HU3x6encDEyurGObx7_.oqs
 1jYWUo9aVkNcEv5GRVnT9MXbgrAP.Uqc6g2DJfsnC4EKtdm8TL7E9MeJeFMGhYHlHqTrMiNK6SAH
 TNnlCzZWzeHbMOelw7bMwzLxetmbhvzzc2Rlbvb2UsOPn8R_R2fY3JKylDrditEy0chydM3iwH2b
 u7j8DxopaNKgcCz1_dyLlneJdtUKEQSqno5IgPOvRSOcegGc.naYhqGy0koUo25X6q1Joue4Xop9
 FOlr7UGsBsOlmaq2w0stPR_eFTUst5qEKyWIubRvBt4pIsfjDkoqycEqPL7vZDhNH_nITzdw0rgg
 TmRWsZNs6sTHgrYK2AP33GooedCmsAw9iGnK0VIZGr_vTjQIfPpPIc4gkTabvnHJT7g02np2l5.M
 OGXpZiHCB_W9h7JkDgFHbQ6wl
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 3 Feb 2020 11:28:02 +0000
Date:   Mon, 3 Feb 2020 11:27:58 +0000 (UTC)
From:   Aisha Gaddafi <gaddafia487@gmail.com>
Reply-To: gaddafia504@gmail.com
Message-ID: <103787947.623232.1580729278150@mail.yahoo.com>
Subject: Dear Friend,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <103787947.623232.1580729278150.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15149 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Dear Friend,

I came across your e-mail contact prior a private search while in need of 
your assistance. My name is Aisha  Gaddafi a single Mother and a Widow with 
three Children. I am the only biological Daughter of late Libyan President 
(Late Colonel Muammar Gaddafi).

I have investment funds worth Twenty Seven Million Five Hundred Thousand 
United State Dollar ($27.500.000.00 ) and i need a trusted investment 
Manager/Partner because of my current refugee status, however, I am 
interested in you for investment project assistance in your country, may be 
from there, we can build business relationship in the nearest future.

I am willing to negotiate investment/business profit sharing ratio with you 
base on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply urgent 
to enable me provide you more information about the investment funds.

Your Urgent Reply Will Be Appreciated.

Best Regards
Mrs Aisha Gaddafi
(gaddafia504@gmail.com)
