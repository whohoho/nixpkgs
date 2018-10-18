{ pkgs, haskellLib }:

with haskellLib;

self: super: {

  # This compiler version needs llvm 5.x.
  llvmPackages = pkgs.llvmPackages_5;

  # Disable GHC 8.6.x core libraries.
  array = null;
  base = null;
  binary = null;
  bytestring = null;
  Cabal = null;
  containers = null;
  deepseq = null;
  directory = null;
  filepath = null;
  ghc-boot = null;
  ghc-boot-th = null;
  ghc-compact = null;
  ghc-heap = null;
  ghc-prim = null;
  ghci = null;
  haskeline = null;
  hpc = null;
  integer-gmp = null;
  libiserv = null;
  mtl = null;
  parsec = null;
  pretty = null;
  process = null;
  rts = null;
  stm = null;
  template-haskell = null;
  terminfo = null;
  text = null;
  time = null;
  transformers = null;
  unix = null;
  xhtml = null;

  # Use to be a core-library, but no longer is since GHC 8.4.x.
  hoopl = self.hoopl_3_10_2_2;

  # LTS-12.x versions do not compile.
  base-orphans = self.base-orphans_0_8;
  contravariant = self.contravariant_1_5;
  free = self.free_5_1;
  haddock-library = self.haddock-library_1_7_0;
  hspec = self.hspec_2_5_8;
  hspec-core = self.hspec-core_2_5_8;
  hspec-discover = self.hspec-discover_2_5_8;
  hspec-meta = self.hspec-meta_2_5_6;
  JuicyPixels = self.JuicyPixels_3_3_2;
  lens = self.lens_4_17;
  neat-interpolation = self.neat-interpolation_0_3_2_4;
  polyparse = markBrokenVersion "1.12" super.polyparse;
  primitive = self.primitive_0_6_4_0;
  QuickCheck = self.QuickCheck_2_12_6_1;
  semigroupoids = self.semigroupoids_5_3_1;
  tagged = self.tagged_0_8_6;

  # https://github.com/tibbe/unordered-containers/issues/214
  unordered-containers = dontCheck super.unordered-containers;

  # https://github.com/haskell/fgl/issues/79
  # https://github.com/haskell/fgl/issues/81
  fgl = appendPatch super.fgl ./patches/fgl-monad-fail.patch;

  # Test suite won't compile with QuickCheck 2.12.x.
  psqueues = dontCheck super.psqueues;

  # Test suite does not compile.
  cereal = dontCheck super.cereal;
  Diff = dontCheck super.Diff;

}
