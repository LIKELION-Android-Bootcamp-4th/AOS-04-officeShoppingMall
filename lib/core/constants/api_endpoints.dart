class Api {
  static const baseUrl = 'http://git.hansul.kr:3004/';

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

  final refreshToken = '/api/auth/refresh';
  final signUp = '/api/auth/register/buyer';
  final login = '/api/auth/login';
  final logout = '/api/auth/logout';
}

// 장바구니
class _CartEndpoints {
  const _CartEndpoints();

  final getAll = '/api/cart';

  /// ## 장바구니에 상품 추가
  /// #### 작성 필수 정보 (Request body)
  /// - `product` (string): 추가할 상품의 고유 ID
  /// - `quantity` (int): 추가할 수량
  /// - `options` (object, optional): 상품 옵션 정보
  ///    - `color` (string, optional): 색상
  ///    - `storage` (string, optional): 저장 용량
  final addCart = '/api/cart';

  /// ## 장바구니에서 선택된 상품 제거
  /// #### 작성 필수 정보 (Request body)
  /// - `cartIds` (List<string>): 제거할 장바구니 항목들의 ID 리스트
  final deleteCart = '/api/cart';
  final getCount = '/api/cart/count';
  final clearCart = '/api/cart/clear';

  /// ## 장바구니 상품으로 주문 생성
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
}

// 카테고리
class _CategoryEndpoints {
  const _CategoryEndpoints();

  /// ## 카테고리 트리 조회
  /// - `includeProductCount`: 각 카테고리 별 상품 수 포함 여부
  /// - `onlyWithProducts`: 상품이 있는 카테고리만 조회 (빈 카테고리 제외)
  /// - `maxLevel`: 최대 레벨
  String getCategoryTree({
    bool includeProductCount = false,
    bool onlyWithProducts = false,
    int maxLevel = 3,
  }) {
    final query = <String, String>{};
    if (includeProductCount) query['includeProductCount'] = includeProductCount.toString();
    if (onlyWithProducts) query['onlyWithProducts'] = onlyWithProducts.toString();
    if (maxLevel != 3) query['maxLevel'] = maxLevel.toString();

    return Uri(
      path: '/api/categories/tree',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }

  /// ## 특정 카테고리 조회
  /// - `categoryId`: 카테고리 ID
  /// - `includeChildren`: 하위 카테고리 포함 여부
  /// - `includeProductCount`: 상품 수 포함 여부
  String getCategory(
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
}

// 마이페이지
class _MypageEndpoints {
  const _MypageEndpoints();

  final getOrUpdateProfile = '/api/mypage/profile';

  /// ## 찜한 상품 목록 조회
  /// - `page`: 페이지 번호
  /// - `limit`: 페이지당 항목 수
  /// - `sort`: 정렬 기준 (createdAt, price, name)
  /// - `order`: 순서 (asc, desc)
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

  /// ## 내 주문 목록 조회
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

  /// ## 내 주문 상세 조회
  /// - `orderId`: 조회할 주문의 고유 ID
  String getOrderDetail(String orderId) {
    return '/api/mypage/orders/$orderId';
  }

  /// ## 내 주문 취소
  /// - `orderId`: 취소할 주문의 고유 ID
  String cancelOrder(String orderId) {
    return '/api/mypage/orders/$orderId/cancel';
  }

  /// ## 최근 본 상품 조회
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

  final createOrder = '/api/orders';
  final getOrders = '/api/orders';

  /// ## 주문 상세 조회
  /// - `orderId`: 조회할 주문의 고유 ID
  String getOrderDetail(String orderId) {
    return '/api/orders/$orderId';
  }
}

// 상품
class _ProductEndpoints {
  const _ProductEndpoints();

  /// ## 상품 목록 검색
  /// - `q`: 검색어 (상품명, 설명, 댓글, 리뷰에서 키워드 검색)
  /// - `categoryId`: 카테고리 ID
  /// - `category`: 카테고리 이름 (대소문자 구분 없음)
  /// - `sort`: 정렬 기준 (relevance, latest, popular, sales, price-asc, price-desc)
  String getProducts({String? q, String? categoryId, String? category, String? sort}) {
    final query = <String, String>{};
    if (q != null && q.isNotEmpty) query['q'] = q;
    if (categoryId != null) query['categoryId'] = categoryId;
    if (category != null) query['category'] = category;
    if (sort != null) query['sort'] = sort;

    return Uri(path: '/api/products', queryParameters: query.isEmpty ? null : query).toString();
  }

  /// ## 상품 상세 조회
  /// - `productId`: 조회할 상품의 고유 ID
  String getProductDetail(String productId) {
    return '/api/products/$productId';
  }

  /// ## 리뷰 작성 (이미지 최대 5개 업로드 가능)
  /// - `productId`: 리뷰를 작성할 상품의 고유 ID
  /// #### 작성 필수 정보 (Request body)
  /// - `rating` (int): 평점 (1~5점)
  /// - `comment` (string): 리뷰 내용
  /// - `orderId` (string, optional): 주문 ID
  /// - `images` (List<file>, optional): 리뷰 이미지들 (최대 5개)
  String writeReview(String productId) {
    return '/api/products/$productId/reviews';
  }

  /// ## 리뷰 목록 조회
  /// - `productId`: 조회할 상품의 고유 ID
  String getReviews(String productId) {
    return '/api/products/$productId/reviews';
  }

  /// ## 상품별 평균 평점 조회
  /// - `productId`: 조회할 상품의 고유 ID
  String getAverageRating(String productId) {
    return '/api/products/$productId/reviews/average';
  }

  /// ## 특정 상품 찜 여부 확인
  /// - `productId`: 찜 여부를 확인할 상품의 고유 ID
  String getFavoriteStatus(String productId) {
    return '/api/products/$productId/favorites';
  }

  /// ## 상품 찜 토글 (추가 또는 삭제)
  /// #### 작성 필수 정보 (Request body)
  /// - `productId` (string): 찜 상태를 변경할 상품의 고유 ID
  String toggleFavorite(String productId) {
    return '/api/products/$productId/toggle-favorites';
  }
}

// 통합검색
class _SearchEndpoints {
  const _SearchEndpoints();

  /// ## 통합 검색 (상품, 콘텐츠, 리뷰, 스토어)
  /// - 검색어는 인기 검색어에 자동 기록
  /// - `q`: 검색어
  /// - `limit`: 전체 결과 제한 (참고용)
  /// - `productLimit`: 상품 결과 개수
  /// - `contentLimit`: 콘텐츠 결과 개수
  /// - `reviewLimit`: 리뷰 결과 개수
  /// - `storeLimit`: 스토어 결과 개수
  /// - `includeProducts`: 상품 검색 포함 여부
  /// - `includeContents`: 콘텐츠 검색 포함 여부
  /// - `includeReviews`: 리뷰 검색 포함 여부
  /// - `includeStores`: 스토어 검색 포함 여부
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

    return Uri(path: '/api/search', queryParameters: query.isEmpty ? null : query).toString();
  }
}

// 검색어
class _KeywordsEndpoints {
  const _KeywordsEndpoints();

  /// ## 인기 검색어 조회
  /// - `limit`: 조회할 검색어 개수
  /// - `timeRange`: 조회 기간 (`today`, `week`, `month`)
  /// - `minCount`: 최소 검색 횟수
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

  /// ## 연관 검색어 조회
  /// - `keyword`: 기준 검색어
  /// - `limit`: 조회할 연관 검색어 개수
  String getRelated(String keyword, {int limit = 5}) {
    final query = <String, String>{};
    if (limit != 5) query['limit'] = limit.toString();

    return Uri(
      path: '/api/keywords/$keyword/related',
      queryParameters: query.isEmpty ? null : query,
    ).toString();
  }
}
