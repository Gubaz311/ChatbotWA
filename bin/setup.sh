ERLANG_VERSION=${ERLANG_VERSION:-19.1}
ERLANG_CACHED_DOWNLOAD="${HOME}/cache/OTP-${ERLANG_VERSION}.tar.gz"
ERLANG_DIR=${ERLANG_DIR:="$HOME/erlang"}

ELIXIR_VERSION=${ELIXIR_VERSION:-1.4.0}
ELIXIR_CACHED_DOWNLOAD="${HOME}/cache/elixir-v${ELIXIR_VERSION}.zip"
ELIXIR_DIR=${ELIXIR_DIR:="$HOME/elixir"}

# Download Erlang
echo Installing Erlang version ${ERLANG_VERSION}
wget --continue --output-document "${ERLANG_CACHED_DOWNLOAD}"  "https://github.com/erlang/otp/releases/download/OTP-23.2.7.4/otp_src_23.2.7.4.tar.gz"
mkdir "${ERLANG_DIR}"
tar -xaf "${ERLANG_CACHED_DOWNLOAD}" --strip-components=1 --directory "${ERLANG_DIR}"
${ERLANG_DIR}/Install -minimal ${ERLANG_DIR}
export PATH="${ERLANG_DIR}/bin:$PATH"

# Download Elixir
echo Installing Elixir version ${ELIXIR_VERSION}
wget --continue --output-document "${ELIXIR_CACHED_DOWNLOAD}"  "https://github.com/elixir-lang/elixir/releases/download/v1.15.7/elixir-otp-26.exe"
mkdir ${ELIXIR_DIR}
cd ${ELIXIR_DIR}
unzip -q ${ELIXIR_CACHED_DOWNLOAD}
export PATH="${ELIXIR_DIR}/bin:$PATH"

cd -
mix local.hex --force
mix local.rebar --force
mix deps.get
