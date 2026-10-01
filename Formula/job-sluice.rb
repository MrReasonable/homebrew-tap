class JobSluice < Formula
  include Language::Python::Virtualenv

  desc "Engineered, config-driven job-hunting pipeline"
  homepage "https://github.com/MrReasonable/sluice"
  url "https://files.pythonhosted.org/packages/9c/d6/81a5003b60d0827975210e998132cbc6a04d67f42c2d33541fd0efe13e5c/job_sluice-2.19.1.tar.gz"
  sha256 "83d0ec940a9a2e956a39188f7e0b60af9f567cbe8129b2bce82e2cc656ff2346"
  license "MIT"

  bottle do
    root_url "https://github.com/mrreasonable/homebrew-tap/releases/download/job-sluice-2.19.1-36888796731-1"
    sha256 cellar: :any, arm64_tahoe:   "239330adf924f77f20081ca90defa7333d0c66ff6e4d59703b691ba30e2c40d8"
    sha256 cellar: :any, arm64_sequoia: "46f8c4fd11e71a8ea50cfd98421f6d7e01b3a25718924ddfe898a9455c3deaab"
  end

  # No `version "..."` stanza here, deliberately. Homebrew's canonical component order is
  # `url, mirror, version, sha256, license` (`FormulaAudit/ComponentsOrder`, a plain cop that
  # fires even without --strict), which the emitted `url`/`sha256`/`license` above already
  # satisfy in the absence of a `version` line -- but a `version` line, wherever placed, would
  # ALSO be flagged by `resource_auditor.rb` as "redundant with version scanned from URL":
  # `Version.detect` on a PyPI sdist filename returns the identical string, so `brew audit
  # --strict --online` fails either way. Homebrew's own `version` -- this Formula's DSL-level
  # accessor, POPULATED by that same `Version.detect` call against the `url` above, not
  # anything this file passes in -- is what `test do`'s `assert_match version.to_s, ...` below
  # reads, so nothing here needs to emit a version a second time.

  depends_on "cffi"
  depends_on "cryptography"
  depends_on "libyaml"
  depends_on "pango"
  depends_on "pillow"
  depends_on "pydantic"
  depends_on "python@3.14"
  depends_on "rpds-py"
  uses_from_macos "libffi"

  pypi_packages package_name:     "job-sluice[render,google,mcp,completion]",
                # Padded to align with `exclude_packages:` below -- RuboCop's
                # Layout/HashAlignment wants a multi-line hash literal's values in one
                # column, and `brew audit --strict` runs it. Measured, not guessed.
                extra_packages:   %w[typing-extensions],
                exclude_packages: %w[cffi cryptography pillow pydantic rpds-py]

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/a9/d2/f4d173e22df740bc37b1db102b386ba719b66e95b0f0d751f556b387e6d2/anyio-4.15.1.tar.gz"
    sha256 "9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94"
  end

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/87/6f/5a73f04007ca950701765949209f068da628bd11f9c2da287278ce91e0ee/argcomplete-3.7.2.tar.gz"
    sha256 "aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00e2a958381b9fc6b9"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985/attrs-26.1.0.tar.gz"
    sha256 "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
  end

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/33/1c/f41d4e74c28ab327ff3acd36053f7ea506c55872d7a90b0fa71aa3ab0c89/charset_normalizer-3.5.2.tar.gz"
    sha256 "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6/click-8.5.0.tar.gz"
    sha256 "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/06/00/2456b6b664c7a770989cbe3c352aac4eb962c938486f03a2e1255ae963c6/cssselect2-0.10.1.tar.gz"
    sha256 "83b0d820ef589dabaf693289b647c2f5b410f76d285f56deba911ffa75a7b9d1"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/87/b6/126c659ab7e0e03e01a5f5d223abf7b2c0691ae92718085a212a3924a2a3/fonttools-4.66.1.tar.gz"
    sha256 "64967c6ddb0d4c610dfd8cb1485981b2d27972ddfb7d4bbbd9e199d2a089c450"
  end

  resource "google-api-core" do
    url "https://files.pythonhosted.org/packages/23/f7/0fb8c3618c783ad49da1aaf97f93a4bb9e4ed522135516b44d129a7f85bb/google_api_core-2.40.0.tar.gz"
    sha256 "ebee7d1b138b5362beecec260e6e8988ac97346562c7382ccb6f0ad8435c599f"
  end

  resource "google-api-python-client" do
    url "https://files.pythonhosted.org/packages/fd/e5/12024a0ae2fd39a54ff47a3868c47344ffff4ff1cd5edf4dff523c1a9fc1/google_api_python_client-2.200.0.tar.gz"
    sha256 "82aa18b851328ea04867fd51c5a0c8da2e1b86ec45ce08487e902e7726d4ee50"
  end

  resource "google-auth" do
    url "https://files.pythonhosted.org/packages/3b/0b/9b4e806ebcd29701b5193a162dd9906c4c5a16cbde8476461622d2bfa70e/google_auth-2.59.0.tar.gz"
    sha256 "eb32f44f89f6b577947ebee5887c1db46e6b1a278889ba369a88179643f32240"
  end

  resource "google-auth-httplib2" do
    url "https://files.pythonhosted.org/packages/30/e8/e050a21cea15ff6480095fec643dcb346466361eb4c0cbe2120b3cb6be67/google_auth_httplib2-0.4.3.tar.gz"
    sha256 "0ba8d2eeab86e820f23466f57c45d509052db0a5f1bef6ed1cf92e4bb75b847d"
  end

  resource "google-auth-oauthlib" do
    url "https://files.pythonhosted.org/packages/c4/40/1d7901e454831247e377ef3f642cb857cc0e82ec4d2380b7a148a48f20d1/google_auth_oauthlib-1.5.0.tar.gz"
    sha256 "b351107c7dd9017f426cbb0272ea1bc04f469020fd18f4443c7d40362e0b1510"
  end

  resource "googleapis-common-protos" do
    url "https://files.pythonhosted.org/packages/8d/2b/6ce81972d5c8cab9705fddce3153be63222d9e12fd96f8baba5038a744dd/googleapis_common_protos-1.75.5.tar.gz"
    sha256 "c7a866fc34ed29a3b10af627a4b9b1dc2433313ca6e959f0ae4feb132047ed72"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore2" do
    url "https://files.pythonhosted.org/packages/cb/f3/1db7aa2bc2524062192bb0e0323969492d1883152a232fe36eea65f4e35c/httpcore2-2.13.1.tar.gz"
    sha256 "e0aa977abe17e69a3b820a24542a6fa88702676d83880b8d194dcd18408e5103"
  end

  resource "httplib2" do
    url "https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b/httplib2-0.32.0.tar.gz"
    sha256 "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
  end

  resource "httpx2" do
    url "https://files.pythonhosted.org/packages/d5/44/474bef2a0e9d90f1715d32cb98b0738695ca17ba324095fb2497ed7fbd59/httpx2-2.13.1.tar.gz"
    sha256 "e48744a19e3af5ee48313d0ce5fe941d5422fae5705ea922a4aabf94d7800dfa"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f5/08/8eea9d4b8302028f3abb2c0813953f7aec26d33b7a8960ed760e65ff29fa/idna-3.20.tar.gz"
    sha256 "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047/jsonschema-4.26.0.tar.gz"
    sha256 "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b/jsonschema_specifications-2025.9.1.tar.gz"
    sha256 "b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/76/31/ac54fb0fdd5b37de704486e288bba4fbbb463f24cfcfedbede407b854513/mcp-2.2.0.tar.gz"
    sha256 "2dc37ecb1974becdcebdbf7561e7c15a07dbbf20ba21ba16c3593b3038b3afbd"
  end

  resource "mcp-types" do
    url "https://files.pythonhosted.org/packages/ae/91/762d7755d971aff8a28d75f7961656148edf27875c8026e6385aaab08ae7/mcp_types-2.2.0.tar.gz"
    sha256 "d3ed53703ddd10d9c6399f29d322bb66f3f67ab41348ac8556ba23e07fedefad"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/7a/d8/a1bcc8ba112a627f8ffbdc212a78ce18d3ac07e91a5ca65d27918eee25a1/oauthlib-4.0.0.tar.gz"
    sha256 "efb274799819440f95b4ab3b818869f1ce9ae26c5beacba0201d1a1b76b54f86"
  end

  resource "opentelemetry-api" do
    url "https://files.pythonhosted.org/packages/1f/dc/e12c1fe1ed8a7b7149777127b1a0e12ce5bd5a81d97408bedc2128c260f5/opentelemetry_api-1.45.0.tar.gz"
    sha256 "711ede81773c8025c2c03dac0450bc89f3d30aea6eabcc815c570d4e35a963f7"
  end

  resource "proto-plus" do
    url "https://files.pythonhosted.org/packages/46/70/783e33ffbb4466cc154a94f79b869b92a451e2bd45605054e68ff68b7af6/proto_plus-1.29.0.tar.gz"
    sha256 "cfb4e62ad7e13dd18f346cabbda00cab39930d36a05791fd81ddb074d6ee884f"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/d9/89/5b8517baa72f84a67b8a307ba953c91057af618bf40bf676f3c03551f8f0/protobuf-7.36.2.tar.gz"
    sha256 "497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/a4/9a/23310166d960def5897e91fe20e5b724601b02a22e84ba1f94232c0b7f67/pyasn1-0.6.4.tar.gz"
    sha256 "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
  end

  resource "pyasn1-modules" do
    url "https://files.pythonhosted.org/packages/e9/e6/78ebbb10a8c8e4b61a59249394a4a594c1a7af95593dc933a349c8d00964/pyasn1_modules-0.4.2.tar.gz"
    sha256 "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6"
  end

  resource "pydyf" do
    url "https://files.pythonhosted.org/packages/36/ee/fb410c5c854b6a081a49077912a9765aeffd8e07cbb0663cfda310b01fb4/pydyf-0.12.1.tar.gz"
    sha256 "fbd7e759541ac725c29c506612003de393249b94310ea78ae44cb1d04b220095"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/43/ea/5194e52748b0da83d71e082d75496eaec6e58f419f5e184786ded517e6a9/pyjwt-2.15.1.tar.gz"
    sha256 "4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/e4/11/b213bebff182584360cb8d17c72c1677fec5c5c228de439e63bcf8ab1c8f/pyparsing-3.3.3.tar.gz"
    sha256 "928ae7e20211f3b6f3915a72f06a0cfd29ab9d24279dd6346b6b1a7146397d36"
  end

  resource "pyphen" do
    url "https://files.pythonhosted.org/packages/94/47/8430452269cd28863d73b903d07d329d058cf762527ff211b3864ba61fc7/pyphen-0.18.1.tar.gz"
    sha256 "dbae6fbbe4f01cb206108b43573d857c67107be9d0e38eb1b08d6fa2210634a7"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad/python_multipart-0.0.32.tar.gz"
    sha256 "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f/referencing-0.37.0.tar.gz"
    sha256 "44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/42/f2/05f29bc3913aea15eb670be136045bf5c5bbf4b99ecb839da9b422bb2c85/requests-oauthlib-2.0.0.tar.gz"
    sha256 "b3dffaebd884d8cd778494369603a9e7b58d29111bf6b41bdc2dcd87203af4e9"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/e4/be/0123026f719d1a7936f214a88b553bb5701e04ff2511147c1dab0c5035eb/sse_starlette-3.5.0.tar.gz"
    sha256 "75de713aa8a9441513cc283220826da079d982770965b951e9437720e8bafdb2"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e/starlette-1.7.0.tar.gz"
    sha256 "c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d"
  end

  resource "tinycss2" do
    url "https://files.pythonhosted.org/packages/a3/ae/2ca4913e5c0f09781d75482874c3a95db9105462a92ddd303c7d285d3df2/tinycss2-1.5.1.tar.gz"
    sha256 "d339d2b616ba90ccce58da8495a78f46e55d4d25f9fd71dfd526f07e7d53f957"
  end

  resource "tinyhtml5" do
    url "https://files.pythonhosted.org/packages/b1/1f/cfe2f6b30557c92b3f31d41707e09cef5c1efbd87392bc6c0430c46b0e4d/tinyhtml5-2.1.0.tar.gz"
    sha256 "60a50ec3d938a37e491efa01af895853060943dcebb5627de5b10d188b338a67"
  end

  resource "truststore" do
    url "https://files.pythonhosted.org/packages/53/a3/1585216310e344e8102c22482f6060c7a6ea0322b63e026372e6dcefcfd6/truststore-0.10.4.tar.gz"
    sha256 "9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/e4/31/3d74fa778a63b98b7374323befcc0be5ab3bd94afd4096a0124e7379152c/tzdata-2026.4.tar.gz"
    sha256 "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
  end

  resource "uritemplate" do
    url "https://files.pythonhosted.org/packages/98/60/f174043244c5306c9988380d2cb10009f91563fc4b31293d27e17201af56/uritemplate-4.2.0.tar.gz"
    sha256 "480c2ed180878955863323eea31b0ede668795de182617fef9c6ca09e6ec9d0e"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e/urllib3-2.8.0.tar.gz"
    sha256 "63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/da/34/30e9280707135d2cfc589dfff3cb796bd07a3aeb1a3e415ba09dd89d7bb4/uvicorn-0.54.0.tar.gz"
    sha256 "a2e33cbfaa0306f8e6b0c13e0cb89d7d7a2da3e62b90c66e18c33d9807b28620"
  end

  resource "weasyprint" do
    url "https://files.pythonhosted.org/packages/8d/0e/461aeb736762862b511034933d5b98d68f812431b7393b026d9ace5f6b42/weasyprint-70.0.tar.gz"
    sha256 "c263abf0e86c747b12af678b67f85f4abbfb97d18a20503031e7ba94e4b8cf8c"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/d5/a0/8fd707bcb776a7be556bad06a2ea5fb9bd519df78ef8e26f70ccf0f38bff/webencodings-0.6.1.tar.gz"
    sha256 "565f9ad031c702dae404e27a099e3e09186a3ab1b9520f06d215502b651fd910"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/74/21/3b6af43a663b22b00e738bb0642931a2579e15da6852613d56c6aa535d28/zopfli-0.4.3.tar.gz"
    sha256 "d3a50f91a13cea9bafe025de8fd87a005eb26de02a4f0c193127ddbf23ac8ebe"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # The ambient environment is NOT clean: any SLUICE_*/CAMOFOX_* variable, or one of this
    # project's other path-shaped env vars, would point a local `brew test` at the
    # maintainer's real vault, config, dedup state, health/audit state, dossier cache, or a
    # real camofox server -- SLUICE_TELEGRAM_TOKEN and SLUICE_TELEGRAM_CHAT in particular are
    # a CREDENTIAL pair sluice/core/log.py reads ahead of config and POSTS with. Swept by NAME
    # PATTERN rather than hand-listed: an earlier version of this block named only
    # SLUICE_CONFIG and VAULT_DIR while this very comment already stated the general
    # principle -- two reviewers independently caught the gap, and CLAUDE.md's "hand-listed
    # names lose" lesson applies here exactly as it does to a Python AST sweep.
    # `to_h` snapshots before iterating. Measured on this Ruby, deleting from ENV during a
    # bare `each_key` is fine -- but depending on a collection's mutation-during-iteration
    # semantics is a hazard worth not taking, and the snapshot costs one allocation. `each_key`
    # rather than `keys.each` because `brew audit --strict` runs Style/HashEachMethods.
    ENV.to_h.each_key do |k|
      ENV.delete(k) if k.match?(/\A(SLUICE|CAMOFOX)_/)
    end
    # Explicitly-named path variables outside that prefix shape -- never hand-guessed, and
    # NOT enumerated from sluice/core/paths.py, which an earlier version of this comment
    # named: that module DEFINES `resolve` and names no variable of its own. The names come
    # from the `resolve(env_var="...")`/`_resolve_path(env_var="...")` CALL SITES and the
    # direct `os.environ.get("...")` reads, which live in other modules under sluice/.
    # Deliberately not listed here by file: tests/test_homebrew_formula.py's
    # `test_the_test_block_sandboxes_every_env_var_sluice_reads` re-derives the whole set by
    # AST-walking sluice/ and fails if a name it finds is neither swept by the pattern above,
    # nor listed below, nor named in that test's own short allow-list of variables that need no
    # sandboxing at all. So this list cannot silently go stale -- and a file list beside it
    # would be one more thing that could.
    %w[VAULT_DIR SEEN_DB TRIAGE_AUDIT DOSSIER_DIR].each do |k|
      ENV.delete(k)
    end
    ENV["HOME"] = testpath
    # All three XDG rungs. sluice/core/paths.py's `resolve()` falls through to the matching
    # rung the instant the explicitly-named var above is deleted: SEEN_DB/SLUICE_HEALTH/
    # TRIAGE_AUDIT/SLUICE_DISABLED to XDG_STATE_HOME, SLUICE_CONFIG to XDG_CONFIG_HOME, and
    # DOSSIER_DIR to XDG_CACHE_HOME -- leaving any one of these three unset here would let that
    # rung fall through to the maintainer's REAL XDG directory instead of this sandbox.
    ENV["XDG_CONFIG_HOME"] = testpath/"config"
    ENV["XDG_STATE_HOME"] = testpath/"state"
    ENV["XDG_CACHE_HOME"] = testpath/"cache"

    assert_match version.to_s, shell_output("#{bin}/job-sluice --version")

    # `doctor --offline` exits 0 on a clean, unconfigured machine, which is exactly what this
    # one is. #243's contract, stated in sluice/core/doctor.py::DoctorReport.exit_code: a
    # component the user has not SUPPLIED yet is SETUP and never reaches the exit code, so no
    # vault directory, no `claude` CLI and no `render` extra are all still 0. Non-zero means
    # something they DID configure is broken.
    #
    # THIS LITERAL WAS `1` FOR TWO RELEASES, and the cost was the whole channel. 2.7.0's
    # `feat(doctor): a verdict by default, and exit 0 on a clean install` inverted the
    # contract; this number did not move; `brew test` then failed the `homebrew` job on 2.7.0
    # and 2.8.0 while every other channel shipped from those same runs, so the public tap went
    # on serving the last version whose job passed. The justification lived only in a comment
    # here that ended "Measured." -- true when written, and nothing could tell when it stopped
    # being true, which is CLAUDE.md's "a comment that states a mechanism needs a row that
    # falsifies it" applied to a release channel.
    # tests/test_homebrew_formula.py::test_the_formula_expects_the_real_clean_install_exit_code
    # is that row: it RUNS `doctor --offline` and compares, so the formula's expectation and
    # the program's behaviour can no longer drift apart in silence.
    #
    # The code is NOT passed explicitly, and that is forced rather than chosen. `shell_output`
    # defaults to 0 and `brew audit`'s RuboCop pass rejects restating it:
    # `FormulaAudit/Test: Passing 0 to shell_output is redundant`. The audit gates the release
    # job, so an explicit `, 0` fails the channel just as surely as the wrong number did --
    # which is how it shipped: 2.9.1 carried `, 0` on the reasoning that a claim this channel
    # had already been broken by should be written down, and that reasoning was never run
    # against the audit. Asserting a mechanism instead of executing it, in the fix for exactly
    # that. `brew style --formula <tap>/<name>` reproduces it locally in seconds.
    #
    # The assertion is unchanged in force: an omitted code still means `brew test` fails unless
    # the command exits 0. Only the spelling moved.
    #
    # This is the only place a release RUNS the shipped binary on a fresh machine and holds it
    # to a status. ci.yml's container smoke deliberately asserts the status in neither
    # direction -- it checks the report is positively present instead -- so it could not have
    # caught this, and `release-please.yml` runs no doctor at all.
    #
    # `--verbose` IS LOAD-BEARING, not extra detail. #243 made `doctor` print a VERDICT by
    # default and demoted the row table to `--verbose`, and the default view lists only rows
    # that still need action -- so a renderer that is `ok`, which is exactly what this formula
    # exists to prove, appears NOWHERE in it. The row assertion below can only ever match the
    # verbose view. Measured: the row shape occurs once under `--verbose` and zero times
    # without it. This cost the channel a third failed release (2.9.2), after the same #243
    # change had already cost it two through the exit code above -- one upstream change, two
    # separate assertions in this block, and fixing the first without auditing the second is
    # what let it repeat.
    report = shell_output("#{bin}/job-sluice doctor --offline --verbose")
    assert_match "job-sluice doctor", report

    # THE PAYOFF, POSITIVE rather than a refutation of "dead": core/app.py's
    # `if cv_cfg is not None:` drops the renderer row ENTIRELY on any load_cv_config error,
    # with exit 1 and the banner intact -- so refuting "dead" passes when the row is merely
    # ABSENT. A negative guard that finds nothing is indistinguishable from success.
    # Row format is `f"{component:12} {subject:32} {state:9} ..."` (cli.py::_print_doctor).
    assert_match(/renderer\s+cv\.renderer\s+ok/, report)

    # ...and independently of sluice's own output format, so a change to doctor's printing
    # cannot silently retire the check above.
    system libexec/"bin/python", "-c",
           "import weasyprint; weasyprint.HTML(string='<p>x</p>').write_pdf('t.pdf')"
    assert_path_exists testpath/"t.pdf"

    # The WeasyPrint probe above proves only the `render` extra. `exclude_packages` above
    # relies on the BREWED interpreter's own site-packages to supply pydantic/rpds-py/cffi --
    # and `mcp` in particular carries a hard pydantic version floor -- so a skew between what
    # this formula ships and what a brewed interpreter's homebrew-core dependencies actually
    # provide would surface as a user-facing ImportError on `mcp`/`google`/`completion` with
    # this job still green. Import each of the other three extras' top-level module or
    # modules the same way the render extra is proven above, against the SAME installed
    # libexec interpreter.
    system libexec/"bin/python", "-c", "import mcp, googleapiclient, google_auth_oauthlib, argcomplete"
  end
end
