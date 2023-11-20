("help,h", "Help screen")
("input,i", boost::program_options::value<std::string>(), "(required) Path to get the input file")
("output,o", boost::program_options::value<std::string>()->default_value("a.ddnnf"), "Path to get the output file")
("input-type,it", boost::program_options::value<std::string>()->default_value("cnf"), "The input type")
("method,m", boost::program_options::value<std::string>(), "(required) The method we run (counting for model counting, ddnnf-compiler for decision DNNF compilation, projMC for a dedicated projected model counting, max#SAT for running a max#sat solver).")
("maxsharpsat-threshold",boost::program_options::value<double>()->default_value(-1.0),"Search if we can find an assignment such that the number of weighted models is greater than a given threshold.")
("maxsharpsat-heuristic-phase",boost::program_options::value<std::string>()->default_value("best"),"The heuristic used to select the phase for the MAX variables (none (use the counter heuristic, weight (test first the literal with the great weight) or best (choose as in the best solution found so far))).")
("maxsharpsat-heuristic-phase-random",boost::program_options::value<unsigned>()->default_value(5),"That is the percentage of random choice for the phase selection.")
("maxsharpsat-option-and-dig",boost::program_options::value<bool>()->default_value(true),"When a decomposable AND node occurs we search for an instantiation to be able to get a bound.")
("maxsharpsat-option-greedy-init",boost::program_options::value<bool>()->default_value(false),"Search for a first max interpretation greedily.")
("solver,s", boost::program_options::value<std::string>()->default_value("minisat"), "The solver we will use")
("projddnnf-pure-lit-elim",boost::program_options::value<bool>()->default_value(true), "pure lit elim")
("preproc-solver,ps", boost::program_options::value<std::string>()->default_value("minisat"), "The solver we will use in the preproc")
("preproc,p",boost::program_options::value<std::string>()->default_value("basic"), "The preprocessing technique we will use (basic, backbone).")
("preproc-equiv",boost::program_options::value<bool>()->default_value(true), "Dont allow variable elimination on none projected variables")
("preproc-ve-check",boost::program_options::value<bool>()->default_value(false), "recheck if a ve candidate")
("preproc-ve-only-simpical",boost::program_options::value<bool>()->default_value(true), "only apply ve to simpical")
("preproc-ve-prefer-simpical",boost::program_options::value<bool>()->default_value(false), "only apply ve to simpical")
("preproc-ve-limit",boost::program_options::value<int>()->default_value(4), "ve occurrence limit")
("scoring-method,sm",boost::program_options::value<std::string>()->default_value("vsads"),"The scoring method used for selecting the next variable. [mom, dlcs, vsids, vsads, jwts]")
("scoring-method-decay-freq",boost::program_options::value<unsigned>()->default_value(300000),"decay ferquency")
("occurrence-manager,om",boost::program_options::value<std::string>()->default_value("dynamic"),"The occurrence manager used. [add a description]")
("phase-heuristic,ph",boost::program_options::value<std::string>()->default_value("polarity"),"The way the phase of the next decision is selected (false, true, polarity or occurrence).")
("partitioning-heuristic,pvh",boost::program_options::value<std::string>()->default_value("decomposition-static-dual"),"The method used to compute a cut. [none, decomposition-static, bipartition-primal or bipartition-dual]")
("partitioning-heuristic-partitioner-np-cost",boost::program_options::value<int>()->default_value(10),"Sets the cost for including a none projected variable in the cutset")
("partitioning-heuristic-max-cut-ratio",boost::program_options::value<float>()->default_value(0.5),"The maxium cutsize in relation to the number of projected variables")
("partitioning-heuristic-partitioner,php",boost::program_options::value<std::string>()->default_value("patoh"),"The partitioner we will call (patoh or kahypar).")
("partitioning-heuristic-bipartite-phase",boost::program_options::value<std::string>()->default_value("none"),"Use a two phases heuristic, where the tree decomposition construction is given in parameter [none, natural, primal or dual].")
("partitioning-heuristic-bipartite-phase-dynamic",boost::program_options::value<double>()->default_value(0),"Use a static decomposition when it seems that the initial decomposition is no more good enough (the given value gives the balanced limit ratio).")
("partitioning-heuristic-bipartite-phase-static",boost::program_options::value<int>()->default_value(0),"Use a static decomposition when the number of variable is more than the given parameter. Switch to the dynamic decomposition otherwise. If 0, this option is deactivated.")
("partitioning-heuristic-simplification-equivalence,phse",boost::program_options::value<bool>()->default_value(true),"The graph with be simplified by considering literal equivalence.")
("partitioning-heuristic-simplification-hyperedge,phsh",boost::program_options::value<bool>()->default_value(true),"The graph with be simplified by reducing the hyper edges.")
("cache-reduction-strategy,crs", boost::program_options::value<std::string>()->default_value("expectation"), "The strategy used to reduce the cache structure [none, expectation, cache or sharpSAT].")
("cache-reduction-strategy-cachet-limit,crscl", boost::program_options::value<unsigned long>()->default_value(10UL * (1<<21)), "The limit in term of number of entries, the cachet reduction strategy allows.")
("cache-reduction-strategy-expectation-limit,crsel", boost::program_options::value<unsigned long>()->default_value(100000), "The frequency in term of number of negative hits used for the expectation reduction strategy allows.")
("cache-reduction-strategy-expectation-ratio,crser", boost::program_options::value<double>()->default_value(0.3), "The ratio used to decide if a clause can be kept or not.")
("cache-size-first-page", boost::program_options::value<unsigned long>()->default_value((1UL<<31)), "The block size of memory allocated for the first page of the cache structure.")
("cache-size-additional-page", boost::program_options::value<unsigned long>()->default_value((1UL<<29)), "The block size of memory allocated for the next page of the cache structure.")

("cache-alloc", boost::program_options::value<std::string>()->default_value("custom"), "cache allocator (custom,std)")
("cache-fixed-size", boost::program_options::value<int>()->default_value(5) , "fixed cache size in gb")
("cache-store-strategy", boost::program_options::value<std::string>()->default_value("not-touched"), "The strategy used to store the clause in a bucket (all, not-binary and not-touched).")
("cache-clause-representation", boost::program_options::value<std::string>()->default_value("index"), "The way the clause are represented in the cache (combi, sym, clause and index).")
("cache-clause-representation-combi-limitVar-sym", boost::program_options::value<unsigned>()->default_value(20), "In the mixed strategy, if we have less than a given number of variable then we use the symmetry caching representation.")
("cache-clause-representation-combi-limitVar-index", boost::program_options::value<unsigned>()->default_value(2000), "In the mixed strategy, if we have more than a given number of variable then we use the index caching representation.")
("cache-limit-number-variable", boost::program_options::value<unsigned>()->default_value(100000), "The number of variables threshold used to decide if the cache is used or not.")
("cache-limit-ratio", boost::program_options::value<double>()->default_value(0), "For the dynamic limit, posHit/negHit < ratio.")
("cache-activated", boost::program_options::value<bool>()->default_value(true), "Activate or not the cache.")
("cache-method", boost::program_options::value<std::string>()->default_value("list"), "The way the collision are handled (no-collision, list, lru, lru-prob).")
("phase-heuristic-reversed,pha", boost::program_options::value<bool>()->default_value(false), "Consider or not the reverse of the current phase.")
("float-precision,fp", boost::program_options::value<int>()->default_value(128), "The precision for the float.")
("float,f", boost::program_options::value<bool>()->default_value(false), "If the count is computed as a float or not.")
("dump-ddnnf", boost::program_options::value<std::string>(), "Print out the decision DNNF formula in a given file.")
("dump-gmap", boost::program_options::value<std::string>(), "Print out the gmap to a given file.")
("query,q", boost::program_options::value<std::string>(), "Perform the queries given in a file (m l1 l2 ... ln 0 for a model counting query, and d l1 l2 ... ln 0 for a satisfiability query).")
("projMC-refinement", boost::program_options::value<bool>()->default_value(false), "Try to reduce the set of selector by computing a MSS.")
("keyword-output-format-solution", boost::program_options::value<std::string>()->default_value("s"), "The keyword prints in front of the solution when it is printed out.")
("output-format", boost::program_options::value<std::string>()->default_value("classic"), "The way the solution is printed out ('classic' only gives the number of solution after printing 's', 'competition' follows the MC competition 2021).")
