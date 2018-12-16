{ pkgs }: with pkgs;

stdenv.mkDerivation rec {
  name = "cpprest";

  src = fetchgit {
    url = "https://github.com/Microsoft/cpprestsdk.git";
    rev = "65267c6e83e7e29ed3bdddde13d2c4bbb10e1bff";
    sha256 = "0xjzlk2q7ms2y2fbl3kna73iv51h6gzdd5gnsdjf390kna7pvza8";
    deepClone = true;
  };

  nativeBuildInputs = [
    cmake
    boost166
    openssl
    zlib
  ];

  # doCheck = true;
  # checkTarget = "test";

  meta = with stdenv.lib; {
    description = "The C++ REST SDK is a Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design. This project aims to help C++ developers connect to and interact with services.";
    homepage = https://github.com/Microsoft/cpprestsdk;
    license = licenses.mit;
#    maintainers = with maintainers; [ radivarig ];
    platforms = with platforms; unix;
  };
}