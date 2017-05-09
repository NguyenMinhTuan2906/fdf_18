Category.create! name: "Do an",
  description: "Tap hop Do an.",
  parent_id: nil

Category.create! name: "Do uong",
  description: "Tap hop Do uong.",
  parent_id: nil

Category.create! name: "Hai San",
  description: "Cac mon an ve tom, cua, ca..",
  parent_id: 1

Category.create! name: "An vat",
  description: "Cac mon an nhanh, fastfood.vv..",
  parent_id: 1

Category.create! name: "Bun",
  description: "Tong hop cac mon bun.",
  parent_id: 1

Category.create! name: "Tra sua",
  description: "Tong hop cac loai tra sua.",
  parent_id: 2

Category.create! name: "Kem",
  description: "Tong hop cac loai kem.",
  parent_id: 2

Product.create! name: "Cua hap bia",
  description: "Cua hap bia la mot trong nhung mon an don gian,
    ngon va pho bien nhat khi nhac den cua bien.",
  price: 120000,
  ratinger: 20,
  quantity: 2,
  current_score: 4.5,
  category_id: 3

ProductImage.create! product_id: 1,
  remote_image_url: "http://sesan.com.vn/upload/hinh-anh/hinh-anh-thumb-1373991508.jpg"

Product.create! name: "Bun bo hue",
  description: "Bun bo hue la mot trong nhung dac san cua xu Hue. Nhac den Hue
    khong ai khong biet den mon an huyen thoai nay.",
  price: 35000,
  ratinger: 20,
  quantity: 2,
  current_score: 5,
  category_id: 5

ProductImage.create! product_id: 2,
  remote_image_url: "http://nau.vn/wp-content/uploads/2014/12/cach-lam-bun-bo-hue.jpg"

Product.create! name: "Bun cha",
  description: "Bun cha la mon an voi bun, cha thit lon nuong tren than hoa va
    bat nuoc mam chua cay man ngot. Mon an nay co xuat xu tu mien bac Viet Nam.",
  price: 25000,
  ratinger: 20,
  quantity: 2,
  current_score: 3.5,
  category_id: 5

ProductImage.create! product_id: 3,
  remote_image_url: "https://media.foody.vn/res/g17/165697/prof/s/foody-mobile-buncha2-jpg-227-635772147293009564.jpg"

Product.create! name: "Ding Tea",
  description: "Ding Tea la thuong hieu do uong lon nhat cua Dai Loan tai Trung Quoc,
    Ding tea dang nhu mot con bao lan rong rat nhanh chong sang cac nuoc Chau A.",
  price: 22000,
  ratinger: 20,
  quantity: 2,
  current_score: 3,
  category_id: 6

ProductImage.create! product_id: 4,
  remote_image_url: "http://trasua.odau.com/media/reviews/photos/original/cd/77/fb/thumb-600-67-1414212783.jpg"

Product.create! name: "ToCo",
  description: "ToCo-Toco la tra sua thuong hieu Viet nhung trong do la su ket hop giua
    huong vi Dai Loan va chat tinh tuy trong net am thuc Viet.",
  price: 30000,
  ratinger: 20,
  quantity: 2,
  current_score: 4.5,
  category_id: 6

ProductImage.create! product_id: 5,
  remote_image_url: "http://channel.mediacdn.vn/prupload/166/2014/09/img20140930135508280.jpg"

Product.create! name: "Kem oc que",
  description: "Kem oc que chac han chang con xa la gi voi tat ca chung ta,
    no gan lien voi tuoi tho mot thoi ngay ngo hon nhien.",
  price: 8000,
  ratinger: 20,
  quantity: 2,
  current_score: 2.5,
  category_id: 7

ProductImage.create! product_id: 6,
  remote_image_url: "http://kemmingo.com/upload/novelties/dau%201500%201_1377928368.png"

User.create! name: "Framgia",
  email: "1@gmail.com",
  address: "Ha Noi",
  password: "1",
  role: 0,
  phone: 987654321

User.create! name: "Member",
  email: "2@gmail.com",
  address: "Ho Chi Minh city",
  password: "2",
  role: 1,
  phone: 123456789

Comment.create! content: "Mon nay nhau rat ngon!",
  user_id: 2,
  product_id: 1

Comment.create! content: "Toi thich bun bo hue!",
  user_id: 2,
  product_id: 2
