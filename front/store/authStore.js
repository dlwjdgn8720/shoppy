import { create } from "zustand";

export const useAuthStore = create((set) => ({
  userId: null,
  role: null,
  accessToken: null,
  isLogin: false,
  authChecked: false, // DB 연동이므로 초기값을 false로 변경
  cartCount: 0,
  cartItems: [], // 로컬 장바구니 아이템 목록
  cartList: [], //장바구니 리스트 공유 - Cart, Checkout 컴포넌트
  isUpdateFlag: false, //장바구니 리스트 수량 변경

  login: ({ userId, role, accessToken, isLogin }) =>
    set({ userId, role, accessToken, isLogin, authChecked: true }),

  logout: () =>
    set({
      userId: null,
      role: null,
      accessToken: null,
      isLogin: false,
      authChecked: true,
      cartCount: 0,
      cartItems: [],
    }),

  initCartCount: (count) => set(() => ({ cartCount: count })),

  setCartCount: () => set((state) => ({ cartCount: state.cartCount + 1 })),
  setIsUpdateFlag: () =>
    set((state) => ({ isUpdateFlag: !state.isUpdateFlag })),
  setCartList: (cartList) => set(() => ({ cartList: cartList })),
}));
