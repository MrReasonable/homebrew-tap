class JobSluice < Formula
  include Language::Python::Virtualenv

  desc "Engineered, config-driven job-hunting pipeline"
  homepage "https://github.com/MrReasonable/sluice"
  url "https://files.pythonhosted.org/packages/12/61/4d51f403ddd962dca65dca4321dd9bc4705bcb2f2a3bba956777e84a62d8/job_sluice-1.2.0.tar.gz"
  sha256 "05c111336422a08282574bc0be090919a3dd5f490cf9fd5b68dfe2652ebea8d7"
  license "MIT"

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
                exclude_packages: %w[cffi cryptography pillow pydantic rpds-py]

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/61/cc/a381afa6efea9f496eff839d4a6a1aed3bfafc7b3ab4b0d1b243a12573dd/anyio-4.14.2.tar.gz"
    sha256 "cfa139f3ed1a23ee8f88a145ddb5ac7605b8bbfd8592baacd7ce3d8bb4313c7f"
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
    url "https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83/charset_normalizer-3.5.1.tar.gz"
    sha256 "6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b/click-8.4.2.tar.gz"
    sha256 "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1/cssselect2-0.9.0.tar.gz"
    sha256 "759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/84/69/c97f2c18e0db87d2c7b15da1974dace76ae938f1cfa22e2727a648b7ed43/fonttools-4.63.0.tar.gz"
    sha256 "caeb583deeb5168e694b65cda8b4ee62abedfa66cf88488734466f2366b9c4e0"
  end

  resource "google-api-core" do
    url "https://files.pythonhosted.org/packages/7b/7c/9be3903e3d45415e8ca493c75f8990a0f6f579d168015d44c379350d0ab0/google_api_core-2.34.0.tar.gz"
    sha256 "98a779fe72de956eb1c9c2f47ff4c4432a668ece1a002ec38bed07ec2698ae59"
  end

  resource "google-api-python-client" do
    url "https://files.pythonhosted.org/packages/13/ff/c58d475046b552754a5ee24d98912506b07ea7ac7f0a434b327ad194ca32/google_api_python_client-2.199.0.tar.gz"
    sha256 "8150816e22e01b36aa4b7523cdc1a2d2164e81c4de8a9b338785d7ecb4390ec2"
  end

  resource "google-auth" do
    url "https://files.pythonhosted.org/packages/db/4c/fa42116a48bab3f7a143cf5042ecff7df9c8b73f8a376203cd534d1dc966/google_auth-2.56.3.tar.gz"
    sha256 "40e229fc901f0a305b553050e5fce562d509bee0435be053abfa91582b51b90c"
  end

  resource "google-auth-httplib2" do
    url "https://files.pythonhosted.org/packages/11/46/79983cb738f0eb14e6ab4f43457aa9652f8d46bc4376b178f676b68c5c37/google_auth_httplib2-0.4.1.tar.gz"
    sha256 "125b1bb4fcfdd2d97f19b673c1f46f831603d0acaffe415c8a35dadb312552a1"
  end

  resource "googleapis-common-protos" do
    url "https://files.pythonhosted.org/packages/72/73/74bcab964c9a7a61f2bb71e8179b0f13e6fa98f7ce00fd168aab291e4a2e/googleapis_common_protos-1.75.1.tar.gz"
    sha256 "d3042c6c5a2d4e67113104d6b6818b59b6bd92a197f2a91508e801fe815cf071"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore2" do
    url "https://files.pythonhosted.org/packages/be/ad/f4f0e57345f1870f3e8cb624e058d7eca6e5a27d33bcc3311d9b618734cd/httpcore2-2.12.0.tar.gz"
    sha256 "9293522bba0aa7c4c8e9e3f040c16575bd8868e155a77fa30c7a9085a5eae648"
  end

  resource "httplib2" do
    url "https://files.pythonhosted.org/packages/84/f5/ccf58de92d61e3ad921119668f54ed36ca1d0cf5dcc5c1657dfb164fd78b/httplib2-0.32.0.tar.gz"
    sha256 "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
  end

  resource "httpx2" do
    url "https://files.pythonhosted.org/packages/7f/f8/579a8b51e42e38ee32647df9f08aa25643ae788e275cc625b199829c4671/httpx2-2.12.0.tar.gz"
    sha256 "7631fe9887a8a2275f4a2540e053aa670fcc50742864a9ae7c66e609fdcf12cf"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/5f/f7/abb373e5757eaec4b922b92f97ec8d6d7e057cf06778247604fbc4e7c3f3/idna-3.19.tar.gz"
    sha256 "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
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
    url "https://files.pythonhosted.org/packages/74/33/32d4dff2c95bb5d897c3ef4c83649a08996b17b58f0a326d2495d4c81179/mcp-2.0.0.tar.gz"
    sha256 "0f440e735c13ece8bb19bc62cf0b86f4313448432fbb77d35e14034f4e050728"
  end

  resource "mcp-types" do
    url "https://files.pythonhosted.org/packages/bb/56/9b8e1c152f61f6c6b07c4b5896c88c7d0ae90bac6ee6306f852fcc5c1eb0/mcp_types-2.0.0.tar.gz"
    sha256 "d7d939b9285c9961ae8866ba75ef85da34d12bafe276efbf4eb6a131786d8379"
  end

  resource "opentelemetry-api" do
    url "https://files.pythonhosted.org/packages/ee/8b/aa9e2d8b8dfa7c946f7dec5d1f8f6ba8eca062f43509a06bdb5ce93d26c0/opentelemetry_api-1.44.0.tar.gz"
    sha256 "67647e5e9566edcf421166fdf022b3537f818635daa852b289e34604dc6fb33a"
  end

  resource "proto-plus" do
    url "https://files.pythonhosted.org/packages/26/6a/056256feb4bd000869aba5c16cf2aa911572ca2a2feb185f86e457b5171e/proto_plus-1.28.3.tar.gz"
    sha256 "5f91b30dafa6bb38d432c5557a6ee1d35ffd40b4b1e0e3ca27260448560b91d9"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/a7/e7/0553e21d25ca4d9f573135775348a372c3ec34a93a71d5f297c3bac38341/protobuf-7.36.0.tar.gz"
    sha256 "e8e09cb0d794c6687926fa558a8a6e72aa10edb997d5ca61da0765f12a3e00ea"
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
    url "https://files.pythonhosted.org/packages/3b/81/58d0ac84e1ef3a3843791d6954d94c0b33d526c75eeb1efbce9d0a4c4077/pyjwt-2.13.0.tar.gz"
    sha256 "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f/pyparsing-3.3.2.tar.gz"
    sha256 "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
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

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/f8/00/b42a44342a054d58cb1115d7c8aa9cb4290dd9442f9c1b91a4b8173dba22/sse_starlette-3.4.8.tar.gz"
    sha256 "ed89ffbb75cbf78a5fe2f2109cd584792ee7f9dfac96f791db546df8f15f3f9c"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/b5/b4/205b0d5241d934e8add0c38aa924c4f9fb7330834ff11e5444db964ec3f9/starlette-1.6.0.tar.gz"
    sha256 "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
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

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/92/ff/5a28bdfd8c3ebec42564ac7d0e54ca3db65044a9314a97f9564fa7a1e926/tzdata-2026.3.tar.gz"
    sha256 "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff9d1415"
  end

  resource "uritemplate" do
    url "https://files.pythonhosted.org/packages/98/60/f174043244c5306c9988380d2cb10009f91563fc4b31293d27e17201af56/uritemplate-4.2.0.tar.gz"
    sha256 "480c2ed180878955863323eea31b0ede668795de182617fef9c6ca09e6ec9d0e"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953/urllib3-2.7.0.tar.gz"
    sha256 "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/f2/0f/3f86e61397dd33bf2ccf28188c40db6a740658aeebbbf6e7dbc101a1f487/uvicorn-0.52.4.tar.gz"
    sha256 "73acfee47a0b133c5de13d219492d62d8a31e935f4fe6e41a232451a15379f86"
  end

  resource "weasyprint" do
    url "https://files.pythonhosted.org/packages/59/53/dcc3885c2f7a47faa45f6b8b801412f5f9e055173a52801ef01c09943c5a/weasyprint-69.0.tar.gz"
    sha256 "a7a32f39ca16bd82ef11de99c92ea4b5f14951c9033af035e451ce4f4ee0a88c"
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

    # `doctor --offline` exits 1 on ANY unconfigured machine BY DESIGN -- no vault directory
    # and no `claude` CLI are both DEAD rows, and exit_code returns 1 on any DEAD. Measured.
    # ci.yml records the same fact for the container smoke and asserts the status in NEITHER
    # direction. Asserting success here would fail every release.
    report = shell_output("#{bin}/job-sluice doctor --offline", 1)
    assert_match "job-sluice doctor", report

    # THE PAYOFF, POSITIVE rather than a refutation of "dead": core/app.py's
    # `if cv_cfg is not None:` drops the renderer row ENTIRELY on any load_cv_config error,
    # with exit 1 and the banner intact -- so refuting "dead" passes when the row is merely
    # ABSENT. A negative guard that finds nothing is indistinguishable from success.
    # Row format is `f"{component:12} {subject:32} {state:9} ..."` (cli.py:1537).
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
    # this job still green. Import each of the other three extras' top-level module the same
    # way the render extra is proven above, against the SAME installed libexec interpreter.
    system libexec/"bin/python", "-c", "import mcp, googleapiclient, argcomplete"
  end
end
