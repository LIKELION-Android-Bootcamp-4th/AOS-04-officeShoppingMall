class Api {
  static const baseUrl = 'http://git.hansul.kr:3004/';
  static const xCompany = '6866fd325b230f5dc709bdf7';

  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';

  static const auth = _AuthEndpoints();
  static const cart = _CartEndpoints();
  static const category = _CategoryEndpoints();
  static const mypage = _MypageEndpoints();
  static const order = _OrderEndpoints();
  static const product = _ProductEndpoints();
  static const search = _SearchEndpoints();
  static const keyword = _KeywordsEndpoints();
}

// 인증 관련
class _AuthEndpoints {
  const _AuthEndpoints();

  /// ## 이메일을 통해 회원 가입 여부 체크 (GET)
  /// - 소셜 로그인 시 기존 회원 여부 확인
  /// - 로그인/회원가입 분기 처리
  /// - 비밀번호 재설정 시 회원 존재 여부 확인
  /// ---
  /// - `email`: 체크할 이메일 주소
  /// - `provider`: 소셜 로그인 제공자별 체크 (local, google, kakao, naver, apple)
  String checkUserExists({required String email, String? provider}) {
    final query = <String, String>{'email': email};
    if (provider != null && provider.isNotEmpty) {
      query['provider'] = provider;
    }

    return Uri(
      path: '/api/auth/check-user-exists',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 닉네임 중복 체크 (GET)
  /// #### 유효성 검사:
  /// - 길이: 2~20자
  /// - 허용 문자: 한글, 영문, 숫자, 언더스코어(_)
  /// - 금지 단어: admin, system 등
  /// - 로그인한 사용자의 경우 본인 닉네임은 제외하고 체크
  /// ---
  /// - `nickname`: 체크할 닉네임
  String checkNickname({required String nickname}) {
    final query = <String, String>{'nickname': nickname};

    return Uri(path: '/api/auth/check-nickname', queryParameters: query).toString();
  }

  /// ## 이메일 중복 체크 (GET)
  /// - 회원가입, 이메일 변경 시 이메일 중복 확인
  /// ---
  /// - `email`: 체크할 이메일 주소
  String checkEmail({required String email}) {
    final query = <String, String>{'email': email};

    return Uri(path: '/api/auth/check-email', queryParameters: query).toString();
  }

  /// ## Access Token 갱신 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `refreshToken`: 리프레시 토큰
  final refreshToken = '/api/auth/refresh';

  /// ## 구매자 회원가입 (이메일 인증 필요) (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `email`: 이메일
  /// - `password`: 비밀번호
  /// - `nickName`: 닉네임
  final signUp = '/api/auth/register/buyer';

  /// ## 이메일 인증 코드 확인 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `email`: 인증할 이메일 주소
  /// - `verificationCode`: 이메일로 발송된 인증 코드
  final verifyEmail = '/api/auth/verify-email';

  /// ## 이메일 인증 코드 재발송 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `email`: 인증 코드를 재발송할 이메일 주소
  final resendVerification = '/api/auth/resend-verification';

  /// ## 로그인 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `email`: 이메일
  /// - `password`: 비밀번호
  final login = '/api/auth/login';

  /// ## 소셜 로그인 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `platformRole`: 사용자 역할 (예: buyer, seller)
  /// - `provider`: 소셜 로그인 제공자 (kakao, google, naver, apple 등)
  /// - `authInfo`: 인증 정보 객체
  ///   - `access_token` (string)
  ///   - `token_type` (string)
  ///   - `refresh_token` (string)
  ///   - `expires_in` (integer)
  ///   - `scope` (string)
  ///   - 기타 프로바이더가 제공하는 필드
  final snsLogin = '/api/auth/sns-login';

  /// ## 로그아웃 (POST)
  final logout = '/api/auth/logout';

  /// ## 비밀번호 변경(관리자용) (PATCH)
  /// - `userId`: 비밀번호를 변경할 사용자 고유 ID
  /// #### 작성 필수 정보 (Request body)
  /// - `isForceChange`: 강제 변경 여부 (boolean)
  /// - `currentPassword`: 기존 비밀번호 (string)
  /// - `newPassword`: 새 비밀번호 (string)
  String changeUserPassword(String userId) {
    return '/api/auth/users/$userId/change-password';
  }
}

// 장바구니
class _CartEndpoints {
  const _CartEndpoints();

  /// ## 내 장바구니 조회 (GET)
  final getCart = '/api/cart';

  /// ## 장바구니에 상품 추가 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `product` (string): 추가할 상품의 고유 ID
  /// - `quantity` (int): 추가할 수량
  /// - `options` (object, optional): 상품 옵션 정보
  ///    - `color` (string, optional): 색상
  ///    - `storage` (string, optional): 저장 용량
  final addCart = '/api/cart/';

  /// ## 장바구니에서 선택된 상품 제거 (DELETE)
  /// #### 작성 필수 정보 (Request body)
  /// - `cartId` (List<string>): 제거할 장바구니 항목들의 ID 리스트
  String deleteCart(String cartId) {
    return '/api/cart/$cartId';
  }

  /// ## 장바구니 업데이트 (수량 변경)
  /// #### 작성 필수 정보 (Request body)
  /// - `cartId` (List<string>): 변경할 장바구니 항목들의 ID 리스트
  String updateCart(String cartId) {
    return 'api/cart/$cartId';
  }

  /// ## 장바구니 개수 조회 (GET)
  final getCount = '/api/cart/count';

  /// ## 장바구니 비우기 (DELETE)
  final clearCart = '/api/cart/clear';

  /// ## 장바구니 상품으로 주문 생성 (POST)
  /// - `cartIds`가 제공되면 선택된 항목만 주문하며, 없으면 전체 장바구니 주문 처리.
  /// #### 작성 필수 정보 (Request body)
  /// - `shippingInfo` (object): 배송 정보
  ///    - `recipient` (string): 수령인 이름
  ///    - `address` (string): 주소
  ///    - `phone` (string): 전화번호
  ///    - `zipCode` (string): 우편번호
  /// - `memo` (string, optional): 배송 메모
  /// - `cartIds` (List<string>, optional): 주문할 장바구니 항목 ID 리스트
  final checkout = '/api/cart/checkout';

  /// ## 장바구니 아이템 수량 변경 (PATCH)
  /// ---
  /// - `cartId`: 수량을 변경할 장바구니 항목의 고유 ID
  /// #### 작성 필수 정보 (Request body)
  /// - `quantity`: 변경할 수량 (0 이상 정수)
  String updateCartQuantity(String cartId) {
    return '/api/cart/$cartId';
  }
}

// 카테고리
class _CategoryEndpoints {
  const _CategoryEndpoints();

  // 현재 사라진 기능
  // /// ## 카테고리 트리 조회 (GET)
  // /// - `includeProductCount`: 각 카테고리 별 상품 수 포함 여부
  // /// - `onlyWithProducts`: 상품이 있는 카테고리만 조회 (빈 카테고리 제외)
  // /// - `maxLevel`: 최대 레벨
  // String getCategoryTree({
  //   bool includeProductCount = false,
  //   bool onlyWithProducts = false,
  //   int maxLevel = 3,
  // }) {
  //   final query = <String, String>{};
  //   if (includeProductCount) query['includeProductCount'] = includeProductCount.toString();
  //   if (onlyWithProducts) query['onlyWithProducts'] = onlyWithProducts.toString();
  //   if (maxLevel != 3) query['maxLevel'] = maxLevel.toString();
  //
  //   return Uri(
  //     path: '/api/categories/tree',
  //     queryParameters: query.isEmpty ? null : query,
  //   ).toString();
  // }

  /// ## 특정 카테고리 조회 (GET)
  /// 하위 카테고리 정보 제공, 상품 수 포함
  /// ---
  /// - `categoryId`: 카테고리 ID
  /// - `includeChildren`: 하위 카테고리 포함 여부 (기본값: true)
  /// - `includeProductCount`: 상품 수 포함 여부 (기본값: false)
  String getCategoriesId(
    String categoryId, {
    bool includeChildren = true,
    bool includeProductCount = false,
  }) {
    final query = <String, String>{};
    if (!includeChildren) query['includeChildren'] = includeChildren.toString();
    if (includeProductCount) query['includeProductCount'] = includeProductCount.toString();

    return Uri(
      path: '/api/categories/$categoryId',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 카테고리 목록 조회 (공개) (GET)
  /// - 페이지네이션, 레벨별 필터링, 검색 기능, 정렬 옵션 제공
  /// ---
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 2-)
  /// - `level`: 특정 레벨의 카테고리만 조회 (1, 2, 3)
  /// - `parentId`: 특정 부모 카테고리 하위 조회
  /// - `search`: 카테고리명 검색
  /// - `sortBy`: 정렬 기준 (name, level, order, productCount, createdAt; 기본값: level, order)
  /// - `sortOrder`: 정렬 순서 (asc, desc; 기본값: asc)
  /// - `includeProductCount`: 상품 수 포함 여부 (기본값: false)
  /// - `onlyWithProducts`: 상품이 있는 카테고리만 조회 (기본값: false)
  String getCategories({
    int page = 1,
    int limit = 20,
    int? level,
    String? parentId,
    String? search,
    String? sortBy,
    String sortOrder = 'asc',
    bool includeProductCount = false,
    bool onlyWithProducts = false,
  }) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();
    if (level != null) query['level'] = level.toString();
    if (parentId != null && parentId.isNotEmpty) query['parentId'] = parentId;
    if (search != null && search.isNotEmpty) query['search'] = search;
    if (sortBy != null && sortBy.isNotEmpty) query['sortBy'] = sortBy;
    if (sortOrder != 'asc') query['sortOrder'] = sortOrder;
    if (includeProductCount) query['includeProductCount'] = 'true';
    if (onlyWithProducts) query['onlyWithProducts'] = 'true';

    return Uri(path: '/api/categories', queryParameters: query.isEmpty ? null : query).toString();
  }
}

// 마이페이지
class _MypageEndpoints {
  const _MypageEndpoints();

  /// ## 내 프로필 조회 (GET)
  final getProfile = '/api/mypage/profile';

  /// ## 내 프로필 수정 (PATCH)
  /// #### 작성 필수 정보 (Request body)
  /// - `nickName`: 사용자 닉네임
  /// - `profileImage`: 프로필 이미지 파일
  /// - `phone`: 전화번호
  /// - `address`: 주소 정보
  final updateProfile = '/api/mypage/profile';

  /// ## 비밀번호 변경 (PATCH)
  /// #### 보안 요구사항
  /// - 현재 비밀번호 확인 필수
  /// - 새 비밀번호는 8자 이상, 영문/숫자/특수문자 포함
  /// - 현재 비밀번호와 동일할 수 없음
  /// #### 변경 후 처리
  /// - 모든 세션 무효화 (재로그인 필요)
  /// - 비밀번호 변경 알림 이메일 발송
  /// #### 작성 필수 정보 (Request body)
  /// - `currentPassword`: 원래 비밀번호
  /// - `newPassword`: 새로운 비밀번호
  /// - `confirmPassword`: 비밀번호 확인
  final updatePassword = '/api/mypage/change-password';

  /// ## 찜한 상품 목록 조회 (GET)
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  /// - `sort`: 정렬 기준 (createdAt, price, name; 기본값: createdAt)
  /// - `order`: 순서 (asc, desc; 기본값: desc)
  String getFavorites({
    int page = 1,
    int limit = 20,
    String sort = 'createdAt',
    String order = 'desc',
  }) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();
    if (sort != 'createdAt') query['sort'] = sort.toString();
    if (order != 'desc') query['order'] = order.toString();

    return Uri(
      path: '/api/mypage/favorites',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 내가 작성한 리뷰 목록 조회 (GET)
  /// - 페이지네이션 지원, 리뷰 대상 상품 정보, 리뷰 이미지, 리뷰 좋아요 수, 답글 수 포함
  /// ---
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  /// - `rating`: 평점 필터
  /// - `sort`: 정렬 기준 (createdAt, rating, likes; 기본값: createdAt)
  String getMyReviews({int page = 1, int limit = 20, int? rating, String sort = 'createdAt'}) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();
    if (rating != null) query['rating'] = rating.toString();
    if (sort != 'createdAt') query['sort'] = sort;

    return Uri(
      path: '/api/mypage/reviews',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 내 주문 목록 조회 (GET)
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  /// - `status`: 주문 상태 필터 (pending, confirmed, preparing, shipped, delivered, cancelled, refunded)
  /// - `startDate`: 주문 시작 날짜 (YYYY-MM-DD)
  /// - `endDate`: 주문 종료 날짜 (YYYY-MM-DD)
  /// - `sort`: 정렬 기준 (createdAt, totalAmount, status; 기본값: createdAt)
  /// - `order`: 정렬 순서 (asc, desc; 기본값: desc)
  String getOrders({
    int? page = 1,
    int? limit = 20,
    String? status,
    String? startDate,
    String? endDate,
    String sort = 'createdAt',
    String order = 'desc',
  }) {
    final query = <String, String>{};
    if (page != null && page != 1) query['page'] = page.toString();
    if (limit != null && limit != 20) query['limit'] = limit.toString();
    if (status != null) query['status'] = status;
    if (startDate != null) query['startDate'] = startDate;
    if (endDate != null) query['endDate'] = endDate;
    if (sort != 'createdAt') query['sort'] = sort;
    if (order != 'desc') query['order'] = order;

    return Uri(
      path: '/api/mypage/orders',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 내 주문 상세 조회 (GET)
  /// - `orderId`: 조회할 주문의 고유 ID
  String getOrderDetail(String orderId) {
    return '/api/mypage/orders/$orderId';
  }

  /// ## 내 주문 취소 (POST)
  /// - `orderId`: 취소할 주문의 고유 ID
  String cancelOrder(String orderId) {
    return '/api/mypage/orders/$orderId/cancel';
  }

  /// ## 최근 본 상품 조회 (GET)
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  String getRecentProducts({int page = 1, int limit = 20}) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();

    return Uri(
      path: '/api/mypage/recent-products',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }
}

// 주문
class _OrderEndpoints {
  const _OrderEndpoints();

  /// ## 주문 생성 (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `items`: 주문할 상품 목록 (배열)
  ///     - `product` (string): 상품 고유 ID
  ///     - `quantity` (integer): 수량
  ///     - `options` (object): 선택 옵션
  ///       - `size` (string)
  ///       - `color` (string)
  ///     - `unitPrice` (number): 단가
  /// - `shippingInfo`: 배송 정보 (object)
  ///   - `recipient` (string): 수령인
  ///   - `address` (string): 배송지 주소
  ///   - `phone` (string): 연락처
  /// - `memo`: 요청 사항 메모 (string)
  final createOrder = '/api/orders';

  /// ## 내 주문 목록 조회 (GET)
  final getOrders = '/api/orders';

  /// ## 주문 상세 조회 (GET)
  /// - `orderId`: 조회할 주문의 고유 ID
  String getOrderDetail(String orderId) {
    return '/api/orders/$orderId';
  }

  /// ## 주문 취소 (PATCH)
  /// - `orderId`: 취소할 주문의 고유 ID
  String cancelOrder(String orderId) {
    return '/api/orders/$orderId/cancel';
  }
}

// 상품
class _ProductEndpoints {
  const _ProductEndpoints();

  /// ## 상품 목록 검색 (GET)
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  /// - `categoryId`: 카테고리 ID
  /// - `category`: 카테고리 이름 (대소문자 구분 없음)
  /// - `search`: 상품명 또는 내용으로 검색
  /// - `sortBy`: 정렬 기준 (relevance, latest, popular, sales, price-asc, price-desc)
  /// - `sortOrder`: 정렬 순서 (asc, desc; 기본값: desc)
  String getProducts({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? category,
    String? search,
    String? sortBy,
    String sortOrder = 'desc',
  }) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();
    if (categoryId != null && categoryId.isNotEmpty) query['categoryId'] = categoryId;
    if (category != null && category.isNotEmpty) query['category'] = category;
    if (search != null && search.isNotEmpty) query['search'] = search;
    if (sortBy != null && sortBy.isNotEmpty) query['sortBy'] = sortBy;
    if (sortOrder != 'desc') query['sortOrder'] = sortOrder;

    return Uri(path: '/api/products', queryParameters: query.isEmpty ? null : query).toString();
  }

  /// ## 상품 상세 조회 (GET)
  /// - `productId`: 조회할 상품의 고유 ID
  String getProductDetail(String productId) {
    return '/api/products/$productId';
  }

  /// ## 리뷰 작성 (이미지 최대 5개 업로드 가능) (POST)
  /// - `productId`: 리뷰를 작성할 상품의 고유 ID
  /// #### 작성 필수 정보 (Request body)
  /// - `rating` (int): 평점 (1~5점)
  /// - `comment` (string): 리뷰 내용
  /// - `orderId` (string, optional): 주문 ID
  /// - `images` (List<file>, optional): 리뷰 이미지들 (최대 5개)
  String writeReview(String productId) {
    return '/api/products/$productId/reviews';
  }

  /// ## 리뷰 목록 조회 (GET)
  /// - `productId`: 조회할 상품의 고유 ID
  String getReviews(String productId) {
    return '/api/products/$productId/reviews';
  }

  /// ## 상품별 평균 평점 조회 (GET)
  /// - `productId`: 조회할 상품의 고유 ID
  String getAverageRating(String productId) {
    return '/api/products/$productId/reviews/average';
  }

  /// ## 특정 상품 찜 여부 확인 (GET)
  /// - `productId`: 찜 여부를 확인할 상품의 고유 ID
  String getFavoriteStatus(String productId) {
    return '/api/products/$productId/favorites';
  }

  /// ## 상품 찜 토글 (추가 또는 삭제) (POST)
  /// #### 작성 필수 정보 (Request body)
  /// - `productId` (string): 찜 상태를 변경할 상품의 고유 ID
  String toggleFavorite(String productId) {
    return '/api/products/$productId/toggle-favorites';
  }

  /// ## 사용자별 최근 본 상품 조회 (GET)
  /// 로그인한 사용자의 최근 본 상품 목록을 조회합니다. 최신순으로 정렬되어 반환됩니다.
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 항목 수 (기본값: 20)
  String getRecentProducts({int page = 1, int limit = 20}) {
    final query = <String, String>{};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();

    return Uri(
      path: '/api/recent-products',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }
}

// 통합검색
class _SearchEndpoints {
  const _SearchEndpoints();

  /// ## 통합 검색 (상품, 콘텐츠, 리뷰, 스토어) (GET)
  /// - 검색어는 인기 검색어에 자동 기록
  /// - `q`: 검색어
  /// - `limit`: 전체 결과 제한 (기본값: 10)
  /// - `productLimit`: 상품 결과 개수  (기본값: 5)
  /// - `contentLimit`: 콘텐츠 결과 개수 (기본값: 3)
  /// - `reviewLimit`: 리뷰 결과 개수 (기본값: 3)
  /// - `storeLimit`: 스토어 결과 개수 (기본값: 2)
  /// - `includeProducts`: 상품 검색 포함 여부 (기본값: true)
  /// - `includeContents`: 콘텐츠 검색 포함 여부 (기본값: true)
  /// - `includeReviews`: 리뷰 검색 포함 여부 (기본값: true)
  /// - `includeStores`: 스토어 검색 포함 여부 (기본값: true)
  /// - `includePosts`: 포스트 검색 포함 여부 (기본값: true)
  String integrated(
    String q, {
    int limit = 10,
    int productLimit = 5,
    int contentLimit = 3,
    int reviewLimit = 3,
    int storeLimit = 2,
    bool includeProducts = true,
    bool includeContents = true,
    bool includeReviews = true,
    bool includeStores = true,
    bool includePosts = true,
  }) {
    final query = <String, String>{};
    query['q'] = q;
    if (limit != 10) query['limit'] = limit.toString();
    if (productLimit != 5) query['productLimit'] = productLimit.toString();
    if (contentLimit != 3) query['contentLimit'] = contentLimit.toString();
    if (reviewLimit != 3) query['reviewLimit'] = reviewLimit.toString();
    if (storeLimit != 2) query['storeLimit'] = storeLimit.toString();
    if (!includeProducts) query['includeProducts'] = includeProducts.toString();
    if (!includeContents) query['includeContents'] = includeContents.toString();
    if (!includeReviews) query['includeReviews'] = includeReviews.toString();
    if (!includeStores) query['includeStores'] = includeStores.toString();
    if (!includePosts) query['includePosts'] = includePosts.toString();

    return Uri(path: '/api/search', queryParameters: query.isEmpty ? null : query).toString();
  }

  /// ## 카테고리별 상세 검색 (GET)
  /// 특정 카테고리(상품, 콘텐츠, 리뷰, 스토어)에서만 검색
  /// #### 검색 카테고리:
  /// - products: 상품만 검색
  /// - contents: 콘텐츠만 검색
  /// - reviews: 리뷰만 검색
  /// - stores: 스토어만 검색
  /// #### 자동 키워드 기록:
  /// 검색어가 인기 검색어에 자동 기록됩니다
  /// - `category`: 검색 카테고리 (products, contents, reviews, stores)
  /// - `q`: 검색어
  /// - `page`: 페이지 번호 (기본값: 1)
  /// - `limit`: 페이지당 결과 개수 (기본값: 20)
  /// - `sort`: 정렬 기준 (relevance, latest, popular; 기본값: relevance)
  String searchByCategory(
    String category, {
    required String q,
    int page = 1,
    int limit = 20,
    String sort = 'relevance',
  }) {
    final query = <String, String>{'q': q};
    if (page != 1) query['page'] = page.toString();
    if (limit != 20) query['limit'] = limit.toString();
    if (sort != 'relevance') query['sort'] = sort;

    return Uri(path: '/api/search/$category', queryParameters: query).toString();
  }
}

// 검색어
class _KeywordsEndpoints {
  const _KeywordsEndpoints();

  /// ## 인기 검색어 조회 (GET)
  /// - `limit`: 조회할 검색어 개수 (기본값: 10)
  /// - `timeRange`: 조회 기간 (`today`, `week`, `month`)
  /// - `minCount`: 최소 검색 횟수 (기본값: 1)
  String getPopular({int limit = 10, String? timeRange, int minCount = 1}) {
    final query = <String, String>{};
    if (limit != 10) query['limit'] = limit.toString();
    if (timeRange != null) query['timeRange'] = timeRange;
    if (minCount != 1) query['minCount'] = minCount.toString();

    return Uri(
      path: '/api/keywords/popular',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 연관 검색어 조회 (GET)
  /// - `keyword`: 기준 검색어
  /// - `limit`: 조회할 연관 검색어 개수  (기본값: 5)
  String getRelated(String keyword, {int limit = 5}) {
    final query = <String, String>{};
    if (limit != 5) query['limit'] = limit.toString();

    return Uri(
      path: '/api/keywords/$keyword/related',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }
}
