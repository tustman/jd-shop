class Sku {
  int skuId;
  String skuName;
  String imageUrl;
  String jdPrice;
  int couponDiscount;
  String commission;
  String couponPrice;

  Sku(this.skuId, this.skuName, this.imageUrl, this.jdPrice,
      this.couponDiscount, this.commission, this.couponPrice);
}

List<Sku> skuList = [
  new Sku(
      18598663047,
      "网易严选 女式超轻便携羽绒服",
      "http://img14.360buyimg.com/n1/jfs/t30754/150/620584033/211315/74385fa/5bf923e0N20dc10cc.jpg",
      "299.00",
      180,
      "6.74",
      "119.00"
  ),
  new Sku(
      18598663047,
      "网易严选 男式超轻便携羽绒服",
      "http://img14.360buyimg.com/n1/jfs/t28027/179/608074825/232550/d4275b6b/5bf91eebN5235aa0d.jpg",
      "299.00",
      180,
      "6.74",
      "119.00"
  ),
  new Sku(
      18598663047,
      "圣诞节礼物送女友生日礼物女生男生恒温杯水杯实用公司年会商务创意礼品送女朋友老婆闺蜜儿童平安夜圣诞礼物 触控杯垫+太阳杯+勺子+礼品袋",
      "http://img14.360buyimg.com/n1/jfs/t26161/130/2131025898/485757/675469c8/5bf7f382N96e19d06.jpg",
      "299.00",
      180,
      "6.74",
      "119.00"
  ),
  new Sku(
      18598663047,
      "【京东】 飞利浦 （PHILIPS）插座/插排/插排/插线板/拖板/插板/儿童保护门 家用安全插座 6位全长1.8米 儿童保护门 高颜值插座",
      "http://img14.360buyimg.com/n1/jfs/t27112/263/2069816847/185978/138b2592/5bf79299Ndcdd6295.jpg",
      "299.00",
      180,
      "6.74",
      "119.00"
  ),
];
