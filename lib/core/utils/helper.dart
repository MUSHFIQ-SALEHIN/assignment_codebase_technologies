class PaginationState<T> {
  final List<T> data;
  final int currentPage;
  final bool isLoading;
  final bool hasMoreData;
  final String? error;

  PaginationState({
    required this.data,
    required this.currentPage,
    required this.isLoading,
    required this.hasMoreData,
    this.error,
  });

  PaginationState.initial()
    : data = [],
      currentPage = 1,
      isLoading = false,
      hasMoreData = true,
      error = null;

  PaginationState<T> copyWith({
    List<T>? data,
    int? currentPage,
    bool? isLoading,
    bool? hasMoreData,
    String? error,
  }) {
    return PaginationState<T>(
      data: data ?? this.data,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      error: error ?? this.error,
    );
  }
}
